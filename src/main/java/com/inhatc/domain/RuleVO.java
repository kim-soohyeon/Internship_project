package com.inhatc.domain;

import lombok.Data;

@Data
public class RuleVO {
	//������ ��ü (Value Object)
	//���̺��� �÷� ���� java���� ��ü�� �ٷ�� ���� ���
	
	//���ȣ
    private int ruleId;
    
    //���θ���ڵ�
    private String pCode;
    
    //���θ�Ǹ�
    private String pName;
       
    //�̻�
    private String more;
    
    //�̸���
    private String under;
    
    //������
    private String pntValue;
}