package com.inhatc.utils;

import java.util.Random;

/**
 * ���޵� �Ķ���Ϳ� �°� ������ �����Ѵ�
 * @param len : ������ ������ ����
 * @param dupCd : �ߺ� ��� ���� (1: �ߺ����, 2:�ߺ�����)
 * 
 */
public class Rand {

	public String numberGen(int len, int dupCd ) {
	        
	        Random rand = new Random();
	        String numStr = ""; //������ ����� ����
	        
	        for(int i=0;i<len;i++) {
	            
	            //0~9 ���� ���� ����
	            String ran = Integer.toString(rand.nextInt(10));
	            
	            if(dupCd==1) {
	                //�ߺ� ���� numStr�� append
	                numStr += ran;
	            }else if(dupCd==2) {
	                //�ߺ��� ������� ������ �ߺ��� ���� �ִ��� �˻��Ѵ�
	                if(!numStr.contains(ran)) {
	                    //�ߺ��� ���� ������ numStr�� append
	                    numStr += ran;
	                }else {
	                    //������ ������ �ߺ��Ǹ� ��ƾ�� �ٽ� �����Ѵ�
	                    i-=1;
	                }
	            }
	        }
	        return numStr;
	    }
}