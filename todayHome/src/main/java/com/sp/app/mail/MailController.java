package com.sp.app.mail;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.domain.mail.Mail;

@Controller
@RequestMapping("mail")
public class MailController {
	
	@Autowired
	private MailServiceImpl mailSender;
	
	

	@PostMapping("send")
	@ResponseBody
	public boolean sendSubmit(@RequestParam String email,HttpSession session) throws Exception {
		String resetPwd = null;
		// 임의의 암호를 생성해준다.
		try {
			resetPwd = mailSender.resetPwd(session);
			
		} catch (Exception e) {
			e.printStackTrace();
		
		
	
		}
		Mail mail = new Mail();
		mail.setReceiverEmail(email);
		mail.setContent("인증번호는" + resetPwd + "입니다.");
		mail.setSubject("인증메일");
		mail.setSenderEmail("gogogo960922@gmail.com");
		mail.setSenderName("오늘의집");
		

		return mailSender.mailSend(mail);
	}
	
	@PostMapping("complete")
	@ResponseBody
	public String complete(@RequestParam String verificationCode, HttpSession session) throws Exception{
		String resetPwd = (String)session.getAttribute("vertificationCode");
	
		try {
			if(resetPwd.equals(verificationCode)) {
				session.invalidate();
				return "true";
				
			} 
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "false";
	}
}
