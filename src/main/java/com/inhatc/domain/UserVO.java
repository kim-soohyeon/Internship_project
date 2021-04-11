package com.inhatc.domain;

import lombok.Data;

@Data
public class UserVO {
	//데이터 객체 (Value Object)
	//테이블의 컬럼 값을 java에서 객체로 다루기 위해 사용
	
	//회원번호
    private int userID;
    
    //회원명
    private String userName;
    
    //연락처
    private String contact;
    
    //이메일
    private String email;
    
    //주소
    private String address;
    
    //사용가능포인트
    private int avaPnt;

    //적립포인트
    private int savPnt;
    
    //성별
    private String gender;
    
    //나이
    private String age;
    
    //직업
    private String job;
    
    //가입일자
    private String regdate;
    
    //마케팅 동의여부
    private String agree;
}