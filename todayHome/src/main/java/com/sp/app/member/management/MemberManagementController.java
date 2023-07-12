package com.sp.app.member.management;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.cart.CartService;
import com.sp.app.domain.common.SessionInfo;
import com.sp.app.domain.member.Member;
import com.sp.app.member.notification.NotificationService;

//단순 조회 시 GET 
//수정 등록은 Post
@Controller
public class MemberManagementController {

	@Autowired
	MemberManagementService memberManagementService;

	@Autowired
	CartService cartService;
	
	@Autowired
	NotificationService notificationService;
	
	@GetMapping("login")
	public String loginForm() {
		return "member/login";
	}

	@PostMapping("login")
	public String loginSubmit(HttpSession httpSession, @RequestParam String email, @RequestParam String password) {
		Member member = memberManagementService.login(email, password);
		int notificationCount = 0;
		System.out.println(member);

		if (member == null) {
			return "redirect:/login";
		}

		Long memberId = member.getMemberId();
		String nickname = member.getNickName();
		Integer role = member.getMemberRoleId();
		String profile = member.getProfileImgName();

		SessionInfo sessionInfo = new SessionInfo(memberId, nickname, role);

		sessionInfo.setProfileImgName(profile);
		
		httpSession.setAttribute("sessionInfo", sessionInfo);
		Integer dataCartCount = cartService.cartDateCountByMemberId(memberId);
		try {
			notificationCount = notificationService.getNotReadNotificationCount(memberId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(notificationCount);
		
		httpSession.setAttribute("dataCartCount", dataCartCount);
		httpSession.setAttribute("notificationCount", notificationCount);
		
		int result = (int) httpSession.getAttribute("notificationCount");
		
		System.out.println("getFromSession : " + result);
		
		return "redirect:/home";
	}

	@PostMapping("logout")
	public String logoutSubmit(HttpSession session) {

		session.invalidate();

		return "redirect:/";

	}
	
	@GetMapping("join")
	public String joinForm(Model model) {
				
		model.addAttribute("msg","");
		
		return "member/join-member";
	}
	

	@PostMapping("join")
	public String joinSubmit( 
			@RequestParam String email,
			@RequestParam String emailDomain,
			@RequestParam String password,
			@RequestParam String nickName
			,Model model) {
		
		String emailSum = email.trim() + "@" + emailDomain.trim();

		Member member = new Member(emailSum,nickName,password);
		System.out.println(member);
		
		try {
			memberManagementService.insertMemberAll(member);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		

		return "redirect:/home";
	}
	
	@GetMapping("member/email-check")
	@ResponseBody
	public boolean emailCheck(@RequestParam("email") String email) {
		
		try {
			return memberManagementService.emailCheck(email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	@GetMapping("member/nickName-check")
	@ResponseBody
	public boolean nickNameCheck(@RequestParam("nickName") String nickName) {
		
		try {
			return memberManagementService.nickNameCheck(nickName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@GetMapping("resetPasswordForm")
	public String resetPasswordForm() {
		return "member/resetPassword";
	}
	
	@PostMapping("resetPassword")
	public String resetPasswordSubmit(@RequestParam String newPassword, @RequestParam String finalEmail) {
		
		try {

			Member memberforId = memberManagementService.readMemberByEmail(finalEmail);
			Long memberId = memberforId.getMemberId();
			
			Member member = new Member();
			member.setPassword(newPassword);
			member.setMemberId(memberId);
			
			memberManagementService.updateMemberPwd(member);
			
			return "redirect:/login";
			
		} catch (Exception e) {
			e.printStackTrace();
			
			return "redirect:/resetPassword";
		}
		
		
	}
	@GetMapping("oauth")
	public String loginKakao() {
		return "member/oauth";
	}
	
	
}
