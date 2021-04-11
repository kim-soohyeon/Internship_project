package com.inhatc.domain;

import lombok.Data;

@Data
public class PromVO {
	//데이터 객체 (Value Object)
	//테이블의 컬럼 값을 java에서 객체로 다루기 위해 사용		
	
	//프로모션코드
    private String pCode;
    
    //프로모션명
    private String pName;
       
    //프로모션 시작일
    private String stadate;
    
    //프로모션 종료일
    private String enddate;
}