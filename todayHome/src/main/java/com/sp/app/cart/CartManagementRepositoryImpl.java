package com.sp.app.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sp.app.common.CommonDAO;
import com.sp.app.domain.cart.Cart;
import com.sp.app.domain.cart.CartOptionMap;


@Repository
public class CartManagementRepositoryImpl implements CartManagementRepository{

	
	@Autowired
	private CommonDAO commonDAO;
	
	@Override
	public void createCart(Cart cart) throws Exception {
		commonDAO.insertData("cart.insertCart", cart);
		

	}
	
	public void createCartStock(CartOptionMap cartOptionMap) throws Exception {
		commonDAO.insertData("cart.insertCartStock",cartOptionMap);
	}

	@Override
	public void updateCartQuantity(Long cartId,Long stockId, Long quantity) throws Exception {
		
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("cartId", cartId);
		map.put("stockId", stockId);
		map.put("quantity", quantity);
		
		commonDAO.updateData("cart.updateQuantity", map);
		
	}

	@Override
	public void deleteCart(Long cartId) throws Exception{
		commonDAO.callUpdateProcedure("cart.deleteCart", cartId);
	}

	@Override
	public List<Cart> getCartList(Long memberId) throws Exception{
		List<Cart> cartList = commonDAO.selectList("cart.selectList", memberId);
		return cartList;
	}

	@Override
	public Integer checkQuantity(Long stockId, Long quantity) throws Exception {
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("stockId", stockId);
		map.put("quantity", quantity);
		
		return commonDAO.selectOne("cart.checkQuantity", map);
	}

	@Override
	public Integer checkCartProduct(Long memberId, Long stockId) throws Exception {
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);

		map.put("stockId", stockId);
		
		return commonDAO.selectOne("cart.checkCartProduct", map);
	}

	@Override
	public List<CartOptionMap> getStockId(Long cartId) throws Exception{
		 List<CartOptionMap> stockIdList = commonDAO.selectList("cart.selectListStock", cartId);
		
		return stockIdList;		
	}

	@Override
	public Long checkCart(Long memberId, Long productId) throws Exception {
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);

		map.put("productId", productId);
		
		return commonDAO.selectOne("cart.checkCart", map);
	}

	@Override
	public Long selectStockPrice(Long stockId) throws Exception {

		return commonDAO.selectOne("cart.selectStockPrice", stockId);
	}

	@Override
	public void deleteStock(Long stockId) throws Exception {
		commonDAO.deleteData("cart.deleteStock",stockId);
	}

}
