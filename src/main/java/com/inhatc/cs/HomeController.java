package com.inhatc.cs;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//������Ʈ�ѷ�
@Controller
public class HomeController {
	//��Ʈ�ѷ�: �𵨰� �並 ������ �ִ� ����
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "user/payment";// �� ���� ����
	}
	
	
}
