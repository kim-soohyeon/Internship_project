package com.inhatc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.inhatc.domain.HisVO;
import com.inhatc.domain.PromVO;
import com.inhatc.domain.RuleVO;
import com.inhatc.domain.UserVO;

public interface UserService {
	 
    //ȸ������ Service
    public int register(UserVO vo);
    
    //ȸ�� ��ȸ  Service
	public UserVO getUserInfo(UserVO vo) throws Exception;

	//ȸ�� ����ȸ  Service
	public UserVO getUserDetailInfo2(String userID) throws Exception;
	
	//���� Service
	public void pro_register(RuleVO rvo);
	
	//���θ�ǵ�� Service
	public void pro_register2(PromVO pvo) throws Exception;

	//���θ�� ��ȸ Service
	public List<PromVO> getPromotion();

	//�� ��ȸ Service
	public List<RuleVO> getRule();
	
	//ȸ������ ����Ǵ� ���θ�� ��ȸ Service
	public List<HashMap> getPntValue(String day, String pay);

	//����Ʈ �̷� ��� Service
	public void pointRegister(@RequestParam Map<String, Object> param_point);

	//�ŷ� �̷� ��� Service
	public int historyRegister(HisVO hisVO);

	//ȸ�� ����Ʈ ���� Service
	public void updateUserPoint(int dPnt2, int userID);//����

	//�ش� ȸ���� �ŷ� �̷� ��ȸ Service
	public List<HashMap> getuserHistory(String userID);

	//�ŷ� �̷� ��ȸ Service
	public List<HashMap> getHistory(String stadate, String enddate);

	//�ŷ� �̷� �� ��ȸ Service
	public List<HashMap> paymentDetail(HisVO vo);

}
