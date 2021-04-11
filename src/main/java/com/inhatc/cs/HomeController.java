package com.inhatc.cs;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//메인컨트롤러
@Controller
public class HomeController {
	//컨트롤러: 모델과 뷰를 연결해 주는 역할
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "user/payment";// 뷰 파일 리턴
	}
	
	
}
