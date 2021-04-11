package com.inhatc.cs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.inhatc.domain.HisVO;
import com.inhatc.domain.UserVO;
import com.inhatc.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	//컨트롤러: 모델과 뷰를 연결해 주는 역할
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired//Spring Framework 에서 지원하는 Dependency 정의 용도의 어노테이션 자동주입이며 종속적이다.
	UserService service;

	// 회원가입 get
	@RequestMapping(value = "/register", method = RequestMethod.GET)// 뷰의 요청 경로 지정
	public void getRegister() throws Exception {
		logger.info("get register");
	}

	// 회원가입 post
	@RequestMapping(value = "/register", method = RequestMethod.POST)// 뷰의 요청 경로 지정
	public String postRegister(UserVO vo) throws Exception {		
		logger.info("post register");

		String day = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());//현재 날짜구하기
		String time = new java.text.SimpleDateFormat("HH:mm:ss").format(new java.util.Date());//현재 시간구하기
		int historyId = 0;//거래번호 선언
		int userID;//회원번호 선언
		vo.setRegdate(day);
		if((vo.getAgree()).equals("동의")) {//마케팅 동의
			vo.setAvaPnt(1000);//가용포인트+1000
			vo.setSavPnt(1000);//적립포인트+1000
			
			HisVO hisVO = new HisVO();//hisVO 객체 생성
			userID=service.register(vo);//회원가입 service호출
			
			hisVO.setUserId(Integer.toString(userID));//회원번호
			hisVO.setUserName(vo.getUserName());//회원명
			hisVO.setDPnt(1000);//거래포인트
			hisVO.setHisdate(vo.getRegdate());//거래일
			hisVO.setHistime(time);//거래시간
			hisVO.setPntType("적립");//거래유형
			historyId = service.historyRegister(hisVO);//거래이력 추가
			
			Map<String, Object> param_point=new HashMap<String, Object>();//HashMap(Map인터페이스의 한종류로써 Key와 Value 값으로 데이터를 저장) 생성
			//put(key,value)
			param_point.put("hisId",historyId);//거래번호
			param_point.put("pCode", "123456");//프로모션코드
			param_point.put("pName", "마케팅 동의 Rule");//프로모션명
			param_point.put("savPnt", 1000);//프로모션별 적립금액
			service.pointRegister(param_point);//포인트이력 추가
		}else {//마케팅 비동의
			vo.setAvaPnt(0);
			vo.setSavPnt(0);
			service.register(vo);
		}		
		return "redirect:/user/search";// '/user/search'로 URL재요청
	}

	// 회원검색 get
	@RequestMapping(value = "/search", method = RequestMethod.GET)// 뷰의 요청 경로 지정
	public String search() throws Exception {
		logger.info("search");

		return "user/search";
	}

	// 회원검색 post 검색값출력(이름, 전화번호, 이메일)
	@RequestMapping(value = "/getUser", method = RequestMethod.POST, produces = "application/json; charset=utf8")// 뷰의 요청 경로 지정
	@ResponseBody
	public String getUser(UserVO vo) throws Exception {
		logger.info("getUser진입");
		UserVO userInfo = service.getUserInfo(vo);//userInfo 객체 생성

		ObjectMapper mapper = new ObjectMapper();//jackson 라이브러리. ObjectMapper를 사용하여 String으로 저장
		String json = mapper.writeValueAsString(userInfo);
		logger.info(json);
		return json;
	}

	// 사용자 상세페이지
	@RequestMapping(value = "/searchDetail", method = RequestMethod.GET)// 뷰의 요청 경로 지정
	@ResponseBody
	public ModelAndView detail(@ModelAttribute("userID") String userID) throws Exception {
		ModelAndView mav = new ModelAndView();

		UserVO userdetailInfo = service.getUserDetailInfo2(userID);
		mav.setViewName("/user/searchDetail");// 리턴 뷰 이름을 지정
		mav.addObject("list", userdetailInfo);//뷰에 전달할 값을 추가
		logger.info("serarchDetail진입");
					
		List<HashMap> userHistory = service.getuserHistory(userID);//Key와 value를 묶어 하나의 개체로 저장
		mav.addObject("userHistory", userHistory);//뷰에 전달할 값을 추가
	
		return mav;
	}

	// 결제 get
	@RequestMapping(value = "/payment", method = RequestMethod.GET)// 뷰의 요청 경로 지정
	public String payment() throws Exception {
		logger.info("payment");

		return "user/payment";// 뷰 파일 리턴
	}

	// 결제 시 회원조회 팝업 get
	@RequestMapping(value = "/child", method = RequestMethod.GET)// 뷰의 요청 경로 지정
	public String child() throws Exception {
		logger.info("child");

		return "user/child";// 뷰 파일 리턴
	}

	// 결제 post
	@RequestMapping(value = "/payment", method = RequestMethod.POST, produces = "application/json; charset=utf8")// 뷰의 요청 경로 지정
	@ResponseBody
	public String payment(String day, String userID, String userName, String avaPnt, String product, String point) throws Exception {

		logger.info("결제post 컨트롤러 진입!");		

		int product2=Integer.parseInt(product); //결제금액 int 형변환
		int point2;//사용포인트 선언
		int dPnt=0;//총 적립률
		String time = new java.text.SimpleDateFormat("HH:mm:ss").format(new java.util.Date());//현재 시간구하기
		
		if(!"".equals(point)){ //만약 받아온 사용포인트가 공백이아니면 형변환하여 저장
		    point2 = Integer.parseInt(point);
		}else//받아온 사용포인트가 공백이면 0으로 저장
			point2=0;
		
		String pay=Integer.toString(product2-point2);//총결제금액(상품금액-사용포인트)
		logger.info("사용포인트는"+point2);
		logger.info("결제 금액은"+pay);
		List<HashMap> dayList = service.getPntValue(day,pay);//dayList는 결제한 사용자에게 적용되는 프로모션 정보담은 맵(프로모션명, 프로모션코드, 적립액)
		
		for(int i=0; i< dayList.size(); i++) {//포인트적립률 전부 더하기			
			dPnt+=Integer.parseInt(dayList.get(i).get("PNTVALUE") + "");
		}

		int dPnt2=(Integer.parseInt(pay)*dPnt)/100;//발생한 포인트 적립률 전체값		
		int historyId = 0;//거래번호 선언
		
		if(Integer.parseInt(pay)>=0) {
			//거래이력추가하기
			if(point2==0) {//포인트를 사용하지않고 결제만 하는 경우			
				HisVO hisVO = new HisVO();	
				hisVO.setUserId(userID);
				hisVO.setUserName(userName);
				hisVO.setDPnt(dPnt2);
				hisVO.setHisdate(day);
				hisVO.setHistime(time);
				hisVO.setPntType("적립");
				logger.info("거래이력은"+hisVO);
				historyId = service.historyRegister(hisVO);
				service.updateUserPoint(dPnt2, Integer.parseInt(userID));
			}else {			
				if(!"0".equals(Integer.toString(point2))) {//포인트를 사용한 경우(사용)
					HisVO hisVO = new HisVO();	
					hisVO.setUserId(userID);
					hisVO.setUserName(userName);
					hisVO.setDPnt(point2*(-1));
					hisVO.setHisdate(day);
					hisVO.setHistime(time);
					hisVO.setPntType("사용");
					logger.info("거래이력은"+hisVO);
					historyId = service.historyRegister(hisVO);			
					service.updateUserPoint(point2*(-1), Integer.parseInt(userID));
				}
				if(Integer.parseInt(pay)>0) {//포인트를 사용하고 남은 금액이 있는 경우(적립)
					HisVO hisVO = new HisVO();	
					hisVO.setUserId(userID);
					hisVO.setUserName(userName);
					hisVO.setDPnt(dPnt2);
					hisVO.setHisdate(day);
					hisVO.setHistime(time);
					hisVO.setPntType("적립");
					logger.info("거래이력은"+hisVO);
					historyId = service.historyRegister(hisVO);
					service.updateUserPoint(dPnt2, Integer.parseInt(userID));
				}
			}	
		}
			
			
		//포인트이력추가하기
			for(int i=0; i< dayList.size(); i++) {

				Map<String, Object> param_point=new HashMap<String, Object>();//HashMap(Map인터페이스의 한종류로써 Key와 Value 값으로 데이터를 저장) 생성
				//put(key,value)
				param_point.put("hisId",historyId);
				param_point.put("pCode", dayList.get(i).get("PCODE"));
				param_point.put("pName", dayList.get(i).get("PNAME"));
				param_point.put("savPnt", (Integer.parseInt(dayList.get(i).get("PNTVALUE")+"")*Integer.parseInt(pay))/100);//프로모션별 적립금액

				service.pointRegister(param_point);
				
			}
				//거래이력 ajax
				Map<String, Object> paymentAjax = new HashMap<String, Object>();//HashMap(Map인터페이스의 한종류로써 Key와 Value 값으로 데이터를 저장) 생성
				//put(key,value)
				paymentAjax.put("avaPnt",Integer.parseInt(avaPnt)-point2+dPnt2+" point" );//가용포인트: 가용-사용+적립
				paymentAjax.put("point", point2+" point");//사용포인트
				paymentAjax.put("savPnt", dPnt2+" point" );//적립포인트
				paymentAjax.put("dayTime", day + ":" + time);//거래일시
				paymentAjax.put("userName", userName);//회원명
				ObjectMapper mapper = new ObjectMapper();//jackson 라이브러리. ObjectMapper를 사용하여 String으로 저장
				String json = mapper.writeValueAsString(paymentAjax);
				logger.info(json);
			return json;			
	}
	
	// 거래이력 get
	@RequestMapping(value = "/paymentList", method = RequestMethod.GET)// 뷰의 요청 경로 지정
	public String paymentList() throws Exception {
		logger.info("payment");

		return "user/paymentList";// 뷰 파일 리턴
	}

	// 거래이력 post
	@RequestMapping(value = "/getHistory", method = RequestMethod.POST, produces = "application/json; charset=utf8")// 뷰의 요청 경로 지정
	@ResponseBody
	public String paymentList(String stadate, String enddate) throws Exception {
		logger.info("paymentList진입");
		
		List<HashMap> History = service.getHistory(stadate,enddate);//HashMap(Map인터페이스의 한종류로써 Key와 Value 값으로 데이터를 저장) 생성

		ObjectMapper mapper = new ObjectMapper();//jackson 라이브러리. ObjectMapper를 사용하여 String으로 저장
		String json = mapper.writeValueAsString(History);
		logger.info(json);
		return json;
	}
	
	//포인트 상세이력 get
	@RequestMapping(value = "/paymentDetail", method = RequestMethod.GET)// 뷰의 요청 경로 지정
	public String paymentDetail(HisVO vo,Model model) throws Exception {
		logger.info("paymentDetail접근!!");
		List<HashMap> paymentDetail=service.paymentDetail(vo);//HashMap(Map인터페이스의 한종류로써 Key와 Value 값으로 데이터를 저장) 생성
	
		model.addAttribute("paymentDetail",paymentDetail);// Model 객체를 이용해서 view로 Data 전달
		
		return "/user/paymentDetail";// 뷰 파일 리턴
	}
	
}