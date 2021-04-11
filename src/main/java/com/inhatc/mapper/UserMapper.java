package com.inhatc.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.inhatc.domain.HisVO;
import com.inhatc.domain.PromVO;
import com.inhatc.domain.RuleVO;
import com.inhatc.domain.UserVO;

public interface UserMapper {
	//  DAO: Data Access Object. Database�� data�� ������ ���� ��ü.
	
    //ȸ������ DAO
    public int register(UserVO vo);

    //ȸ���˻� DAO
	public UserVO getUserInfo(UserVO vo) throws Exception;
	
	//ȸ���� DAO
	public UserVO getUserDetailInfo2(String userID) throws Exception;
	
	//�� ��� DAO
	public void pro_register(RuleVO rvo);
	
	//���θ�� ��� DAO
	public void pro_register2(PromVO pvo) throws Exception;

	//���θ�� ��ȸ DAO
	public List<PromVO> getPromotion();

	//�� ��ȸ DAO
	public List<RuleVO> getRule();	
	
	//ȸ������ ����Ǵ� ���θ�� ��ȸ DAO
	public List<HashMap> getPntValue(@Param("day") String day, @Param("pay") String pay);
	
	//����Ʈ �̷� ��� DAO
	public void pointRegister(@RequestParam Map<String, Object> param_point);

	//�ŷ� �̷� ��� DAO
	public int historyRegister(HisVO hisVO);

	//ȸ�� ����Ʈ ���� DAO
	public void updateUserPoint(@Param("dPnt2") int dPnt2, @Param("userID") int userID);
	
	//�ش� ȸ���� �ŷ� �̷� ��ȸ DAO
	public List<HashMap> getuserHistory(String userID);

	//�ŷ� �̷� ��ȸ DAO
	public List<HashMap> getHistory(@Param("stadate") String stadate, @Param("enddate") String enddate);
	
	//�ŷ� �̷� �� ��ȸ DAO
	public List<HashMap> paymentDetail(HisVO vo);

}


