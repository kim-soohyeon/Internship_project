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
	//��Ʈ�ѷ�: �𵨰� �並 ������ �ִ� ����
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired//Spring Framework ���� �����ϴ� Dependency ���� �뵵�� ������̼� �ڵ������̸� �������̴�.
	UserService service;

	// ȸ������ get
	@RequestMapping(value = "/register", method = RequestMethod.GET)// ���� ��û ��� ����
	public void getRegister() throws Exception {
		logger.info("get register");
	}

	// ȸ������ post
	@RequestMapping(value = "/register", method = RequestMethod.POST)// ���� ��û ��� ����
	public String postRegister(UserVO vo) throws Exception {		
		logger.info("post register");

		String day = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());//���� ��¥���ϱ�
		String time = new java.text.SimpleDateFormat("HH:mm:ss").format(new java.util.Date());//���� �ð����ϱ�
		int historyId = 0;//�ŷ���ȣ ����
		int userID;//ȸ����ȣ ����
		vo.setRegdate(day);
		if((vo.getAgree()).equals("����")) {//������ ����
			vo.setAvaPnt(1000);//��������Ʈ+1000
			vo.setSavPnt(1000);//��������Ʈ+1000
			
			HisVO hisVO = new HisVO();//hisVO ��ü ����
			userID=service.register(vo);//ȸ������ serviceȣ��
			
			hisVO.setUserId(Integer.toString(userID));//ȸ����ȣ
			hisVO.setUserName(vo.getUserName());//ȸ����
			hisVO.setDPnt(1000);//�ŷ�����Ʈ
			hisVO.setHisdate(vo.getRegdate());//�ŷ���
			hisVO.setHistime(time);//�ŷ��ð�
			hisVO.setPntType("����");//�ŷ�����
			historyId = service.historyRegister(hisVO);//�ŷ��̷� �߰�
			
			Map<String, Object> param_point=new HashMap<String, Object>();//HashMap(Map�������̽��� �������ν� Key�� Value ������ �����͸� ����) ����
			//put(key,value)
			param_point.put("hisId",historyId);//�ŷ���ȣ
			param_point.put("pCode", "123456");//���θ���ڵ�
			param_point.put("pName", "������ ���� Rule");//���θ�Ǹ�
			param_point.put("savPnt", 1000);//���θ�Ǻ� �����ݾ�
			service.pointRegister(param_point);//����Ʈ�̷� �߰�
		}else {//������ ����
			vo.setAvaPnt(0);
			vo.setSavPnt(0);
			service.register(vo);
		}		
		return "redirect:/user/search";// '/user/search'�� URL���û
	}

	// ȸ���˻� get
	@RequestMapping(value = "/search", method = RequestMethod.GET)// ���� ��û ��� ����
	public String search() throws Exception {
		logger.info("search");

		return "user/search";
	}

	// ȸ���˻� post �˻������(�̸�, ��ȭ��ȣ, �̸���)
	@RequestMapping(value = "/getUser", method = RequestMethod.POST, produces = "application/json; charset=utf8")// ���� ��û ��� ����
	@ResponseBody
	public String getUser(UserVO vo) throws Exception {
		logger.info("getUser����");
		UserVO userInfo = service.getUserInfo(vo);//userInfo ��ü ����

		ObjectMapper mapper = new ObjectMapper();//jackson ���̺귯��. ObjectMapper�� ����Ͽ� String���� ����
		String json = mapper.writeValueAsString(userInfo);
		logger.info(json);
		return json;
	}

	// ����� ��������
	@RequestMapping(value = "/searchDetail", method = RequestMethod.GET)// ���� ��û ��� ����
	@ResponseBody
	public ModelAndView detail(@ModelAttribute("userID") String userID) throws Exception {
		ModelAndView mav = new ModelAndView();

		UserVO userdetailInfo = service.getUserDetailInfo2(userID);
		mav.setViewName("/user/searchDetail");// ���� �� �̸��� ����
		mav.addObject("list", userdetailInfo);//�信 ������ ���� �߰�
		logger.info("serarchDetail����");
					
		List<HashMap> userHistory = service.getuserHistory(userID);//Key�� value�� ���� �ϳ��� ��ü�� ����
		mav.addObject("userHistory", userHistory);//�信 ������ ���� �߰�
	
		return mav;
	}

	// ���� get
	@RequestMapping(value = "/payment", method = RequestMethod.GET)// ���� ��û ��� ����
	public String payment() throws Exception {
		logger.info("payment");

		return "user/payment";// �� ���� ����
	}

	// ���� �� ȸ����ȸ �˾� get
	@RequestMapping(value = "/child", method = RequestMethod.GET)// ���� ��û ��� ����
	public String child() throws Exception {
		logger.info("child");

		return "user/child";// �� ���� ����
	}

	// ���� post
	@RequestMapping(value = "/payment", method = RequestMethod.POST, produces = "application/json; charset=utf8")// ���� ��û ��� ����
	@ResponseBody
	public String payment(String day, String userID, String userName, String avaPnt, String product, String point) throws Exception {

		logger.info("����post ��Ʈ�ѷ� ����!");		

		int product2=Integer.parseInt(product); //�����ݾ� int ����ȯ
		int point2;//�������Ʈ ����
		int dPnt=0;//�� ������
		String time = new java.text.SimpleDateFormat("HH:mm:ss").format(new java.util.Date());//���� �ð����ϱ�
		
		if(!"".equals(point)){ //���� �޾ƿ� �������Ʈ�� �����̾ƴϸ� ����ȯ�Ͽ� ����
		    point2 = Integer.parseInt(point);
		}else//�޾ƿ� �������Ʈ�� �����̸� 0���� ����
			point2=0;
		
		String pay=Integer.toString(product2-point2);//�Ѱ����ݾ�(��ǰ�ݾ�-�������Ʈ)
		logger.info("�������Ʈ��"+point2);
		logger.info("���� �ݾ���"+pay);
		List<HashMap> dayList = service.getPntValue(day,pay);//dayList�� ������ ����ڿ��� ����Ǵ� ���θ�� �������� ��(���θ�Ǹ�, ���θ���ڵ�, ������)
		
		for(int i=0; i< dayList.size(); i++) {//����Ʈ������ ���� ���ϱ�			
			dPnt+=Integer.parseInt(dayList.get(i).get("PNTVALUE") + "");
		}

		int dPnt2=(Integer.parseInt(pay)*dPnt)/100;//�߻��� ����Ʈ ������ ��ü��		
		int historyId = 0;//�ŷ���ȣ ����
		
		if(Integer.parseInt(pay)>=0) {
			//�ŷ��̷��߰��ϱ�
			if(point2==0) {//����Ʈ�� ��������ʰ� ������ �ϴ� ���			
				HisVO hisVO = new HisVO();	
				hisVO.setUserId(userID);
				hisVO.setUserName(userName);
				hisVO.setDPnt(dPnt2);
				hisVO.setHisdate(day);
				hisVO.setHistime(time);
				hisVO.setPntType("����");
				logger.info("�ŷ��̷���"+hisVO);
				historyId = service.historyRegister(hisVO);
				service.updateUserPoint(dPnt2, Integer.parseInt(userID));
			}else {			
				if(!"0".equals(Integer.toString(point2))) {//����Ʈ�� ����� ���(���)
					HisVO hisVO = new HisVO();	
					hisVO.setUserId(userID);
					hisVO.setUserName(userName);
					hisVO.setDPnt(point2*(-1));
					hisVO.setHisdate(day);
					hisVO.setHistime(time);
					hisVO.setPntType("���");
					logger.info("�ŷ��̷���"+hisVO);
					historyId = service.historyRegister(hisVO);			
					service.updateUserPoint(point2*(-1), Integer.parseInt(userID));
				}
				if(Integer.parseInt(pay)>0) {//����Ʈ�� ����ϰ� ���� �ݾ��� �ִ� ���(����)
					HisVO hisVO = new HisVO();	
					hisVO.setUserId(userID);
					hisVO.setUserName(userName);
					hisVO.setDPnt(dPnt2);
					hisVO.setHisdate(day);
					hisVO.setHistime(time);
					hisVO.setPntType("����");
					logger.info("�ŷ��̷���"+hisVO);
					historyId = service.historyRegister(hisVO);
					service.updateUserPoint(dPnt2, Integer.parseInt(userID));
				}
			}	
		}
			
			
		//����Ʈ�̷��߰��ϱ�
			for(int i=0; i< dayList.size(); i++) {

				Map<String, Object> param_point=new HashMap<String, Object>();//HashMap(Map�������̽��� �������ν� Key�� Value ������ �����͸� ����) ����
				//put(key,value)
				param_point.put("hisId",historyId);
				param_point.put("pCode", dayList.get(i).get("PCODE"));
				param_point.put("pName", dayList.get(i).get("PNAME"));
				param_point.put("savPnt", (Integer.parseInt(dayList.get(i).get("PNTVALUE")+"")*Integer.parseInt(pay))/100);//���θ�Ǻ� �����ݾ�

				service.pointRegister(param_point);
				
			}
				//�ŷ��̷� ajax
				Map<String, Object> paymentAjax = new HashMap<String, Object>();//HashMap(Map�������̽��� �������ν� Key�� Value ������ �����͸� ����) ����
				//put(key,value)
				paymentAjax.put("avaPnt",Integer.parseInt(avaPnt)-point2+dPnt2+" point" );//��������Ʈ: ����-���+����
				paymentAjax.put("point", point2+" point");//�������Ʈ
				paymentAjax.put("savPnt", dPnt2+" point" );//��������Ʈ
				paymentAjax.put("dayTime", day + ":" + time);//�ŷ��Ͻ�
				paymentAjax.put("userName", userName);//ȸ����
				ObjectMapper mapper = new ObjectMapper();//jackson ���̺귯��. ObjectMapper�� ����Ͽ� String���� ����
				String json = mapper.writeValueAsString(paymentAjax);
				logger.info(json);
			return json;			
	}
	
	// �ŷ��̷� get
	@RequestMapping(value = "/paymentList", method = RequestMethod.GET)// ���� ��û ��� ����
	public String paymentList() throws Exception {
		logger.info("payment");

		return "user/paymentList";// �� ���� ����
	}

	// �ŷ��̷� post
	@RequestMapping(value = "/getHistory", method = RequestMethod.POST, produces = "application/json; charset=utf8")// ���� ��û ��� ����
	@ResponseBody
	public String paymentList(String stadate, String enddate) throws Exception {
		logger.info("paymentList����");
		
		List<HashMap> History = service.getHistory(stadate,enddate);//HashMap(Map�������̽��� �������ν� Key�� Value ������ �����͸� ����) ����

		ObjectMapper mapper = new ObjectMapper();//jackson ���̺귯��. ObjectMapper�� ����Ͽ� String���� ����
		String json = mapper.writeValueAsString(History);
		logger.info(json);
		return json;
	}
	
	//����Ʈ ���̷� get
	@RequestMapping(value = "/paymentDetail", method = RequestMethod.GET)// ���� ��û ��� ����
	public String paymentDetail(HisVO vo,Model model) throws Exception {
		logger.info("paymentDetail����!!");
		List<HashMap> paymentDetail=service.paymentDetail(vo);//HashMap(Map�������̽��� �������ν� Key�� Value ������ �����͸� ����) ����
	
		model.addAttribute("paymentDetail",paymentDetail);// Model ��ü�� �̿��ؼ� view�� Data ����
		
		return "/user/paymentDetail";// �� ���� ����
	}
	
}