package com.sp.app.mypage.managerment;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sp.app.common.FileManager;
import com.sp.app.domain.common.SessionInfo;
import com.sp.app.domain.member.Member;

import com.sp.app.member.follow.FollowService;

import com.sp.app.member.management.MemberManagementService;

@Controller
@RequestMapping("mypage")
public class MypageController {
	
	@Autowired
	FollowService followService;
	
	@Autowired
	MemberManagementService memberManagementService;
	
	@Autowired
	CouponService couponService;
	
	@Autowired
	private FileManager fileManager;
	
	@GetMapping("{memberId}")
	public String myPageAll(Model model, @PathVariable Long memberId) throws Exception{
		Member member = memberManagementService.readMemberById(memberId);
		int couponCount = couponService.memberCouponCount(memberId);
		int followerCount = followService.followerCount(memberId);
		int followeeCount = followService.followingCount(memberId);
		model.addAttribute("member",member);
		model.addAttribute("couponCount",couponCount);
		model.addAttribute("followerCount", followerCount);
		model.addAttribute("followeeCount", followeeCount);
		return "mypage/all-view";
	}
	
	@GetMapping("{memberId}/photo")
	public String myPagePhoto(@PathVariable Long memberId, Model model) throws Exception{
		Member member = memberManagementService.readMemberById(memberId);
		int couponCount = couponService.memberCouponCount(memberId);
		int followerCount = followService.followerCount(memberId);
		int followeeCount = followService.followingCount(memberId);
		model.addAttribute("member",member);
		model.addAttribute("couponCount",couponCount);
		model.addAttribute("followerCount", followerCount);
		model.addAttribute("followeeCount", followeeCount);
		return "mypage/my-photo";
	}
	
	@GetMapping("{memberId}/book")
	public String myPageBook(@PathVariable Long memberId, Model model) throws Exception{
		Member member = memberManagementService.readMemberById(memberId);
		int couponCount = couponService.memberCouponCount(memberId);
		model.addAttribute("member",member);
		model.addAttribute("couponCount",couponCount);
		return "mypage/my-book";
	}
	
	@GetMapping("{memberId}/edit")
	public String myPageMemberedit(@PathVariable Long memberId, HttpSession session, Model model) throws Exception{
		
		SessionInfo info = (SessionInfo)session.getAttribute("sessionInfo");
		
		if(info.getMemberId() == null) {
			return "/home";
		}
		
		Member member = memberManagementService.readMemberById(memberId);

		model.addAttribute("member", member);
		
		return "mypage/edit-member";
	}
	
	@PostMapping("{memberId}/edit")
	public String myPageMemberUpdate(
			@ModelAttribute Member member, HttpSession session) throws Exception{
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "member";
		
		System.out.println("테스트 : " + member.getMemberId() + " : " + member.getNickName() + " : " + member.getProfileImgName() + " : " + member.getInfo());
		
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		

		
		return "redirect:/mypage/"+member.getMemberId();
	}
	
}
