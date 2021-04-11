package com.inhatc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inhatc.domain.HisVO;
import com.inhatc.domain.PromVO;
import com.inhatc.domain.RuleVO;
import com.inhatc.domain.UserVO;
import com.inhatc.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService{
	//serviceimpl은 비즈니스로직을 수행하는 역할. class. 기능을 구현하는 구현부
	
    @Autowired
    private UserMapper dao;
 
    // 회원 가입
    @Override
    public int register(UserVO vo){
        dao.register(vo);
        return vo.getUserID();
    }

    //회원 조회
	@Override
	public UserVO getUserInfo(UserVO vo) throws Exception {
		return  dao.getUserInfo(vo);
	}
	
	//회원 상세조회
	@Override
	public UserVO getUserDetailInfo2(String userID) throws Exception {
		return dao.getUserDetailInfo2(userID);
	}

	//룰등록
	@Override
	public void pro_register(RuleVO rvo){
		dao.pro_register(rvo);		
	}

	//프로모션등록
	@Override
	public void pro_register2(PromVO pvo) throws Exception {
		dao.pro_register2(pvo);		
	}

	//프로모션 조회
	@Override
	public List<PromVO> getPromotion() {
		return dao.getPromotion();
	}

	//룰 조회
	@Override
	public List<RuleVO> getRule() {
		return dao.getRule();
	}

	//회원에게 적용되는 프로모션 조회
	@Override
	public List<HashMap> getPntValue(String day, String pay){
		return dao.getPntValue(day,pay);
	}
	
	//포인트 이력 등록
	@Override
	public void pointRegister(Map<String, Object> param_point) {
		dao.pointRegister(param_point);		
	}

	//거래 이력 등록
	@Override
	public int historyRegister(HisVO hisVO) {
		dao.historyRegister(hisVO);		
		System.out.println(hisVO.getHisId());		 
		return hisVO.getHisId();		
	}

	//회원 포인트 수정
	@Override
	public void updateUserPoint(int dPnt2, int userID) {
		dao.updateUserPoint(dPnt2, userID);
		
	}

	//해당 회원의 거래 이력 조회
	@Override
	public List<HashMap> getuserHistory(String userID) {
		return dao.getuserHistory(userID);
	}

	//거래 이력 조회
	@Override
	public List<HashMap> getHistory(String stadate, String enddate) {
		return dao.getHistory(stadate,enddate);
	}

	//거래 이력 상세 조회
	@Override
	public List<HashMap> paymentDetail(HisVO vo) {
		return dao.paymentDetail(vo);
	}


}
