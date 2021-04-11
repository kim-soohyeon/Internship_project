package com.inhatc.domain;

import lombok.Data;

@Data
public class HisVO {
	//������ ��ü (Value Object)
	//���̺��� �÷� ���� java���� ��ü�� �ٷ�� ���� ���
	
	//�ŷ���ȣ
	private int hisId;
	
	//ȸ����ȣ
    private String userId;
    
    //�̸�
    private String userName;
       
    //�߻�����Ʈ
    private int dPnt;
    
    //�ŷ�����
    private String hisdate;

    //�ŷ��Ͻ�
	private String histime;
	
	//����Ʈ����
	private String pntType;
}