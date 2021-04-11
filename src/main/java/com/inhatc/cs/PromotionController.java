package com.inhatc.cs;

import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.inhatc.domain.PromVO;
import com.inhatc.domain.RuleVO;
import com.inhatc.service.UserService;
import com.inhatc.utils.Rand;

@Controller
@RequestMapping("/promotion/*")
public class PromotionController {
	//��Ʈ�ѷ�: �𵨰� �並 ������ �ִ� ����
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired//Spring Framework ���� �����ϴ� Dependency ���� �뵵�� ������̼� �ڵ������̸� �������̴�.
	UserService service;
		
	// ȸ������ get
	@RequestMapping(value = "/register", method = RequestMethod.GET)// ���� ��û ��� ����
	public void getRegister() throws Exception {
		logger.info("get promotion register");
	}

	// ȸ������  post
	@RequestMapping(value = "/register", method = RequestMethod.POST)// ���� ��û ��� ����
	public String postRegister(RuleVO rvo, PromVO pvo) throws Exception {
		logger.info("post promotion register");
		
		//�޸��� �������� ��Ʈ����  List���·� ��ȯ
		List<String> moreList = Arrays.asList(rvo.getMore().split(","));
		List<String> underList = Arrays.asList(rvo.getUnder().split(","));
		List<String> pntValueList = Arrays.asList(rvo.getPntValue().split(","));
		logger.info("�̸�����:"+underList);
		Rand rand = new Rand();
		String pCode=rand.numberGen(6,2);//6�ڸ� �ߺ������Ͽ� ���θ�� �ڵ����
		pvo.setPCode(pCode);
		logger.info(""+pvo.getPCode());
		service.pro_register2(pvo);//���θ�� ���
		if(moreList.size() >0) {//�迭 ����� 0 �̻��϶�
			for(int i=0; i<moreList.size(); i++) {//�迭�� ũ�⸸ŭ �ݺ��Ͽ� insert
				rvo.setPCode(pCode);//���θ���ڵ�
				rvo.setMore(moreList.get(i));//�̻� list
				rvo.setUnder(underList.get(i));//�̸��� list	
				rvo.setPntValue(pntValueList.get(i));//������ list
				service.pro_register(rvo);//���θ�� �� ���
			}
		}
		return "redirect:/promotion/searchEdit";//'/promotion/searchEdit'�� URL���û

	}	

	//���θ�� ��ȸ get
	@RequestMapping(value = "/searchEdit", method = RequestMethod.GET)// ���� ��û ��� ����
	public String searchEdit(Model model) throws Exception {//Model��ü: Controller���� ������ �����͸� ��Ƽ� View�� ������ �� ����ϴ� ��ü
		logger.info("searchEdit");

		List<PromVO> promotion = service.getPromotion();//���θ�� ����Ʈ ����
		List<RuleVO> rule = service.getRule();//���θ�� �� ����Ʈ ����
		
		// Model ��ü�� �̿��ؼ� view�� Data ����
		model.addAttribute("promotion",promotion);
		model.addAttribute("rule",rule);
		
		logger.info("���θ��:"+promotion.get(0).getPCode());
		logger.info("��:"+rule);
		return "promotion/searchEdit";// �� ���� ����
	}
	
}
