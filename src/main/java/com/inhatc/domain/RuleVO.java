package com.inhatc.domain;

import lombok.Data;

@Data
public class RuleVO {
	//데이터 객체 (Value Object)
	//테이블의 컬럼 값을 java에서 객체로 다루기 위해 사용
	
	//룰번호
    private int ruleId;
    
    //프로모션코드
    private String pCode;
    
    //프로모션명
    private String pName;
       
    //이상값
    private String more;
    
    //미만값
    private String under;
    
    //적립률
    private String pntValue;
}