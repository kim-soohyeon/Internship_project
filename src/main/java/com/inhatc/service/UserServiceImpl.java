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
	//serviceimpl�� ����Ͻ������� �����ϴ� ����. class. ����� �����ϴ� ������
	
    @Autowired
    private UserMapper dao;
 
    // ȸ�� ����
    @Override
    public int register(UserVO vo){
        dao.register(vo);
        return vo.getUserID();
    }

    //ȸ�� ��ȸ
	@Override
	public UserVO getUserInfo(UserVO vo) throws Exception {
		return  dao.getUserInfo(vo);
	}
	
	//ȸ�� ����ȸ
	@Override
	public UserVO getUserDetailInfo2(String userID) throws Exception {
		return dao.getUserDetailInfo2(userID);
	}

	//����
	@Override
	public void pro_register(RuleVO rvo){
		dao.pro_register(rvo);		
	}

	//���θ�ǵ��
	@Override
	public void pro_register2(PromVO pvo) throws Exception {
		dao.pro_register2(pvo);		
	}

	//���θ�� ��ȸ
	@Override
	public List<PromVO> getPromotion() {
		return dao.getPromotion();
	}

	//�� ��ȸ
	@Override
	public List<RuleVO> getRule() {
		return dao.getRule();
	}

	//ȸ������ ����Ǵ� ���θ�� ��ȸ
	@Override
	public List<HashMap> getPntValue(String day, String pay){
		return dao.getPntValue(day,pay);
	}
	
	//����Ʈ �̷� ���
	@Override
	public void pointRegister(Map<String, Object> param_point) {
		dao.pointRegister(param_point);		
	}

	//�ŷ� �̷� ���
	@Override
	public int historyRegister(HisVO hisVO) {
		dao.historyRegister(hisVO);		
		System.out.println(hisVO.getHisId());		 
		return hisVO.getHisId();		
	}

	//ȸ�� ����Ʈ ����
	@Override
	public void updateUserPoint(int dPnt2, int userID) {
		dao.updateUserPoint(dPnt2, userID);
		
	}

	//�ش� ȸ���� �ŷ� �̷� ��ȸ
	@Override
	public List<HashMap> getuserHistory(String userID) {
		return dao.getuserHistory(userID);
	}

	//�ŷ� �̷� ��ȸ
	@Override
	public List<HashMap> getHistory(String stadate, String enddate) {
		return dao.getHistory(stadate,enddate);
	}

	//�ŷ� �̷� �� ��ȸ
	@Override
	public List<HashMap> paymentDetail(HisVO vo) {
		return dao.paymentDetail(vo);
	}


}
