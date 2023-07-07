package com.sp.app.board;

import java.io.File;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mongodb.DuplicateKeyException;
import com.sp.app.common.MyUtil;
import com.sp.app.domain.board.ListBoard;
import com.sp.app.domain.board.UserBoard;
import com.sp.app.domain.common.SessionInfo;

@Controller
@RequestMapping("/community/picture/")
public class UserBoardContorller {
	@Autowired
	private UserBoardService userBoardservice;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("picture-list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String col,
			@RequestParam(defaultValue = "") String kwd,
			@RequestParam(defaultValue = "0") int userBoardContentCategoryId,
			@RequestParam(defaultValue = "0") int userBoardCategoryId,
			HttpServletRequest req,
			Model model) throws Exception {
		
		String cp = req.getContextPath();
		
		int size = 100;
		int dataCount;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "UTF-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("col", col);
		map.put("kwd", kwd);
		map.put("userBoardContentCategoryId", userBoardContentCategoryId);
		map.put("userBoardCategoryId", userBoardCategoryId);
		
		//dataCount = service.dataCount(map);
		//}
		
		int offset = (current_page - 1) * size;
		if(offset < 0 ) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<ListBoard> listBoard = userBoardservice.listBoard(map);
		
		
		String articleUrl = cp + "/community/picture/picture-article";
		
	//	String query = "&col=" + col + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		
	//	articleUrl += "?" + query;
		
		model.addAttribute("col", col);
		model.addAttribute("kwd", kwd);	
		model.addAttribute("listBoard", listBoard);
		model.addAttribute("userBoardContentCategoryId", userBoardContentCategoryId);
		model.addAttribute("userBoardCategoryId", userBoardCategoryId);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		
		
		return "community/picture/picture-list";
	}
	
	
	
	
	
	@GetMapping("write")
	public String writeForm(HttpSession session, Model model) throws Exception{
		model.addAttribute("mode", "write");
		
		return "community/picture/picture-write";
	}
	
	@PostMapping("write")
	public String writeSubmit(UserBoard userBoard,  
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "housePicture";
		
		SessionInfo info = (SessionInfo) session.getAttribute("sessionInfo");
		try {
			userBoard.setMemberId(info.getMemberId());
			userBoardservice.createBoard(userBoard, path);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/community/picture/picture-list";
	}
	
	@RequestMapping(value = "picture-article")
	public String article(@RequestParam long userBoardId,
			HttpSession session,
			Model model) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("sessionInfo");

		UserBoard userBoard = userBoardservice.readBoard(userBoardId);
		
		List<UserBoard> userBoardContent = userBoardservice.readContent(userBoard.getUserBoardId());
		
		
		// userBoard.setContent(userBoard.getContent().replaceAll("\n", "<br>"));
		long memberId = info.getMemberId();

		
		boolean userBoardLiked = userBoardservice.userBoardLiked(userBoardId, memberId);
		
		model.addAttribute("userBoardLiked", userBoardLiked);
		model.addAttribute("userBoard", userBoard);
		model.addAttribute("userBoardContent",userBoardContent);
		
		return "community/picture/picture-article";
	}
	
	@RequestMapping(value = "deleteBoard")
	public String deleteBoard(@RequestParam long userBoardId,
			HttpSession session) throws Exception{
		
		try {
			userBoardservice.deleteBoard(userBoardId);
		} catch (Exception e) {
		}
		
	return "redirect:/community/picture/picture-list";
	}
	
	@PostMapping("insertBoardLike")
	@ResponseBody
	public Map<String, Object> insertBoardLike(@RequestParam long userBoardId,
			@RequestParam boolean userBoardLiked,
			HttpSession session) throws Exception{
		
		String state = "true";
		int boardLikeCount = 0;
		SessionInfo info = (SessionInfo) session.getAttribute("sessionInfo");
		
		long memberId = info.getMemberId();
		
		try {
			if(userBoardLiked) {
				userBoardservice.deleteBoardLike(userBoardId, memberId);
			} else {
				userBoardservice.insertBoardLike(userBoardId, memberId);
			}
			
		} catch (DuplicateKeyException e) {
			state = "liked";
		} catch (Exception e) {
			state = "false";
		}
			
			boardLikeCount = userBoardservice.boardLikeCount(userBoardId);
			
			Map<String, Object> model = new HashMap<>();
			model.put("state", state);
			model.put("boardLikeCount", boardLikeCount);
			
			return model;
		
	}
	
	@PostMapping("insertBoardScrap")
	@ResponseBody
	public Map<String, Object> insertBoardScrap(@RequestParam long userBoardId,
			@RequestParam boolean userBoardScraped,
			HttpSession session) throws Exception{
		
		String state = "true";
		int boardScrapCount = 0;
		SessionInfo info = (SessionInfo) session.getAttribute("sessionInfo");
		
		long memberId = info.getMemberId();
		
		try {
			if(userBoardScraped) {
				userBoardservice.deleteBoardScrap(userBoardId, memberId);
			} else {
				userBoardservice.insertScrapLike(userBoardId, memberId);
			}
			
		} catch (DuplicateKeyException e) {
			state = "liked";
		} catch (Exception e) {
			state = "false";
		}
			
		boardScrapCount = userBoardservice.boardScrapCount(userBoardId);
			
			Map<String, Object> model = new HashMap<>();
			model.put("state", state);
			model.put("boardScrapCount", boardScrapCount);
			
			return model;
		
	}
	
}
