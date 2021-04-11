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
	//컨트롤러: 모델과 뷰를 연결해 주는 역할
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired//Spring Framework 에서 지원하는 Dependency 정의 용도의 어노테이션 자동주입이며 종속적이다.
	UserService service;
		
	// 회원가입 get
	@RequestMapping(value = "/register", method = RequestMethod.GET)// 뷰의 요청 경로 지정
	public void getRegister() throws Exception {
		logger.info("get promotion register");
	}

	// 회원가입  post
	@RequestMapping(value = "/register", method = RequestMethod.POST)// 뷰의 요청 경로 지정
	public String postRegister(RuleVO rvo, PromVO pvo) throws Exception {
		logger.info("post promotion register");
		
		//콤마로 나누어진 스트링을  List형태로 변환
		List<String> moreList = Arrays.asList(rvo.getMore().split(","));
		List<String> underList = Arrays.asList(rvo.getUnder().split(","));
		List<String> pntValueList = Arrays.asList(rvo.getPntValue().split(","));
		logger.info("미만값은:"+underList);
		Rand rand = new Rand();
		String pCode=rand.numberGen(6,2);//6자리 중복제거하여 프로모션 코드생성
		pvo.setPCode(pCode);
		logger.info(""+pvo.getPCode());
		service.pro_register2(pvo);//프로모션 등록
		if(moreList.size() >0) {//배열 사이즈가 0 이상일때
			for(int i=0; i<moreList.size(); i++) {//배열의 크기만큼 반복하여 insert
				rvo.setPCode(pCode);//프로모션코드
				rvo.setMore(moreList.get(i));//이상값 list
				rvo.setUnder(underList.get(i));//미만값 list	
				rvo.setPntValue(pntValueList.get(i));//적립률 list
				service.pro_register(rvo);//프로모션 룰 등록
			}
		}
		return "redirect:/promotion/searchEdit";//'/promotion/searchEdit'로 URL재요청

	}	

	//프로모션 조회 get
	@RequestMapping(value = "/searchEdit", method = RequestMethod.GET)// 뷰의 요청 경로 지정
	public String searchEdit(Model model) throws Exception {//Model객체: Controller에서 생성한 데이터를 담아서 View로 전달할 때 사용하는 객체
		logger.info("searchEdit");

		List<PromVO> promotion = service.getPromotion();//프로모션 리스트 생성
		List<RuleVO> rule = service.getRule();//프로모션 룰 리스트 생성
		
		// Model 객체를 이용해서 view로 Data 전달
		model.addAttribute("promotion",promotion);
		model.addAttribute("rule",rule);
		
		logger.info("프로모션:"+promotion.get(0).getPCode());
		logger.info("룰:"+rule);
		return "promotion/searchEdit";// 뷰 파일 리턴
	}
	
}
