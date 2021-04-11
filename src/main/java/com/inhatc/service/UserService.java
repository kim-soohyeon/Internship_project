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
	 
    //회원가입 Service
    public int register(UserVO vo);
    
    //회원 조회  Service
	public UserVO getUserInfo(UserVO vo) throws Exception;

	//회원 상세조회  Service
	public UserVO getUserDetailInfo2(String userID) throws Exception;
	
	//룰등록 Service
	public void pro_register(RuleVO rvo);
	
	//프로모션등록 Service
	public void pro_register2(PromVO pvo) throws Exception;

	//프로모션 조회 Service
	public List<PromVO> getPromotion();

	//룰 조회 Service
	public List<RuleVO> getRule();
	
	//회원에게 적용되는 프로모션 조회 Service
	public List<HashMap> getPntValue(String day, String pay);

	//포인트 이력 등록 Service
	public void pointRegister(@RequestParam Map<String, Object> param_point);

	//거래 이력 등록 Service
	public int historyRegister(HisVO hisVO);

	//회원 포인트 수정 Service
	public void updateUserPoint(int dPnt2, int userID);//적립

	//해당 회원의 거래 이력 조회 Service
	public List<HashMap> getuserHistory(String userID);

	//거래 이력 조회 Service
	public List<HashMap> getHistory(String stadate, String enddate);

	//거래 이력 상세 조회 Service
	public List<HashMap> paymentDetail(HisVO vo);

}
