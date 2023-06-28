package com.sp.app.product.management;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sp.app.cart.CartService;
import com.sp.app.domain.cart.Cart;
import com.sp.app.domain.cart.CartOptionMap;
import com.sp.app.domain.common.SessionInfo;
import com.sp.app.domain.product.Product;
import com.sp.app.domain.product.ProductMainOption;
import com.sp.app.domain.product.ProductStock;
import com.sp.app.domain.seller.Seller;
import com.sp.app.seller.SellerService;
import org.apache.poi.util.StringUtil;
import org.apache.tiles.request.ApplicationContext;
import org.apache.xmlbeans.ResourceLoader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping()
public class ProductManagementController {

	@Autowired
	private ProductManagementService productManagementService;

	@Autowired
	private SellerService sellerService;

	@Autowired
	private CartService cartService;

	@GetMapping("seller/product")
	public String addProductForm(Model model) {
		// 임시 셀러 아이디
		model.addAttribute("sellerId", 1L);
		model.addAttribute("mode", "post");

		return "seller/product/add-product-form";
	}

	@PostMapping("seller/post-product")
	public String addProductSubmit(
			@ModelAttribute Product product,
			@RequestParam List<String> mainOptionName,
			@RequestParam String subOptionName,
			@RequestParam List<Integer> stockPrice,
			@RequestParam List<Integer> stockQuantity,
			@RequestParam MultipartFile[] contentImg,
			@RequestParam MultipartFile[] productImg
			) {
//
//		ObjectMapper objectMapper = new ObjectMapper();
//
//		System.out.println("product = " + product);
//		System.out.println("mainOptionName = " + mainOptionName);
//		System.out.println("subOptionName = " + subOptionName);
//		System.out.println("stockPrice = " + stockPrice);
//		System.out.println("stockQuantity = " + stockQuantity);
//		String[][] readSubNamesList;
//
//		try {
//			readSubNamesList = objectMapper.readValue(subOptionName, String[][].class);
//		} catch (JsonProcessingException e) {
//			throw new RuntimeException(e);
//		}
//
//		for (String[] subNames : readSubNamesList) {
//			for (String subName : subNames) {
//				System.out.print(subName + " ");
//			}
//			System.out.println();
//		}
//
//		productManagementService.createProduct(product, mainOptionName, readSubNamesList, stockPrice, stockQuantity);


		try {
			String uploadDir = "/Users/kun/Downloads/saveTest";

			for (MultipartFile img : productImg) {
				LocalDateTime now = LocalDateTime.now();
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS");
				String fileName = now.format(formatter);

				try {
					String contentType = img.getContentType();
					String[] split = contentType.split("/");

					Path filePath = Path.of(uploadDir + File.separator + fileName + "." + split[1]);

					Files.copy(img.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

//		for (MultipartFile img : contentImg) {
//			System.out.println(img.getOriginalFilename());
//
//		}

		return "redirect:/home";
	}

	@PostMapping("get-map-test")
	@ResponseBody
	public String test(@RequestBody List<Object> map) {
		System.out.println(map);
		return "ok";
	}

	@GetMapping("product/{productId}")
	public String productDetail(@SessionAttribute(value = "sessionInfo", required = false) SessionInfo sessionInfo,@PathVariable Long productId, Model model) {

		Long memberId;
		boolean isScrap = false;

		if (sessionInfo != null) {
			memberId = sessionInfo.getMemberId();
			isScrap = productManagementService.isScrapProduct(memberId, productId);
		}

		int scrapCnt = productManagementService.scrapCnt(productId);
		Product product = productManagementService.getProductById(productId);
		Long sellerId = product.getSellerId();

		Seller seller;
		try {
			seller = sellerService.getSellerBySellerId(sellerId);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		List<ProductStock> stockList = productManagementService.getStockListByProductId(productId);
		int mainOptionCnt = productManagementService.getMainOptionCnt(productId);
		List<ProductMainOption> mainOptionList = productManagementService.getMainOptionListByProductId(productId);

		model.addAttribute("product", product);
		model.addAttribute("stockList", stockList);
		model.addAttribute("mainOptionCnt", mainOptionCnt);
		model.addAttribute("mainOptionList", mainOptionList);
		model.addAttribute("isScrap", isScrap);
		model.addAttribute("scrapCnt", scrapCnt);
		model.addAttribute("seller", seller);

		return "shop/product-detail";
	}

	// 장바구니 버튼 클릭
	@PostMapping("product/cart")
	@ResponseBody
	public String addProductToCart(
			@SessionAttribute(value = "sessionInfo") SessionInfo sessionInfo,
			@RequestBody Map<String, Object> data) {
		Cart cart = new Cart();

		Long memberId = sessionInfo.getMemberId();

		System.out.println(data);

		Long productId = Long.valueOf((String) data.get("productId"));
		List<List<Object>> options = (List<List<Object>>) data.get("selectedOptions");

		List<CartOptionMap> cartOptionMapList = new ArrayList<>();

		for (List<Object> option : options) {
			Long stockId = Long.valueOf((String) option.get(0));
			Long quantity = Long.valueOf((String) option.get(1));

			cartOptionMapList.add(new CartOptionMap(stockId, quantity));
		}

//		Cart cart = new Cart(memberId, productId, cartOptionMapList);

		cart.setProductId(productId);
		cart.setMemberId(memberId);
		cart.setStockList(cartOptionMapList);

		System.out.println(cart.getMemberId());


		try {
			cartService.createCart(cart);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "ok";
	}

	@ResponseBody
	@PostMapping("product/scrap")
	public boolean scrapProduct(@RequestParam Long productId, @SessionAttribute(value = "sessionInfo", required = false) SessionInfo sessionInfo) {
		if (sessionInfo == null) {
			return false;
		}
		Long memberId = sessionInfo.getMemberId();

		try {
			productManagementService.scrapProduct(memberId, productId);
		} catch (Exception e) {
			return false;
		}

		return true;
	}
}
