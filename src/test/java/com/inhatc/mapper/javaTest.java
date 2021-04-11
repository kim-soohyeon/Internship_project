package com.inhatc.mapper;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.inhatc.domain.TestVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class javaTest{
   @Setter(onMethod_=@Autowired)
   private BoardMapper mapper;
   
   
	/* @Test */
   public void TestInsert() {
      TestVO board=new TestVO();
      board.setAa("g");

      mapper.insert(board);
      
      log.info(board);
   }

   
}