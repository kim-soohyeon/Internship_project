package com.inhatc.domain;

import lombok.Data;

@Data
public class UserVO {
	//������ ��ü (Value Object)
	//���̺��� �÷� ���� java���� ��ü�� �ٷ�� ���� ���
	
	//ȸ����ȣ
    private int userID;
    
    //ȸ����
    private String userName;
    
    //����ó
    private String contact;
    
    //�̸���
    private String email;
    
    //�ּ�
    private String address;
    
    //��밡������Ʈ
    private int avaPnt;

    //��������Ʈ
    private int savPnt;
    
    //����
    private String gender;
    
    //����
    private String age;
    
    //����
    private String job;
    
    //��������
    private String regdate;
    
    //������ ���ǿ���
    private String agree;
}