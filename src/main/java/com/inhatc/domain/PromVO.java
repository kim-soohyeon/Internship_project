package com.inhatc.domain;

import lombok.Data;

@Data
public class PromVO {
	//������ ��ü (Value Object)
	//���̺��� �÷� ���� java���� ��ü�� �ٷ�� ���� ���		
	
	//���θ���ڵ�
    private String pCode;
    
    //���θ�Ǹ�
    private String pName;
       
    //���θ�� ������
    private String stadate;
    
    //���θ�� ������
    private String enddate;
}