package com.inhatc.domain;

import lombok.Data;

@Data
public class HisVO {
	//데이터 객체 (Value Object)
	//테이블의 컬럼 값을 java에서 객체로 다루기 위해 사용
	
	//거래번호
	private int hisId;
	
	//회원번호
    private String userId;
    
    //이름
    private String userName;
       
    //발생포인트
    private int dPnt;
    
    //거래일자
    private String hisdate;

    //거래일시
	private String histime;
	
	//포인트유형
	private String pntType;
}