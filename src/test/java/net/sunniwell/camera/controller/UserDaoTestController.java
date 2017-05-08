package net.sunniwell.camera.controller;

import java.util.List;

import javax.annotation.Resource;

import net.sunniwell.camera.model.User;
import net.sunniwell.camera.mongo.UserDao;

import org.apache.log4j.Logger;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/** 
 * @author  763915703@qq.com
 * @date 创建时间：2017年4月24日 下午3:37:30 
 * @version 1.0 
 * 测试springIoc是否成功 Created by tl on 17/2/11.
 * <p/>
 * 注解@ContextConfiguration表示将ApplicationContext对象注入进来，就不用像以往那样在测试程序里先new了，直接使用
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/spring/spring-context.xml", "classpath:/spring/springmvc-servlet.xml" })
public class UserDaoTestController {

	// 在任何需要记录日志的类中
	private static Logger logger = Logger.getLogger(UserDaoTestController.class);

	@Resource
	private UserDao userDao;

	/**
	 * 测试Spring IOC的开发环境
	 */
	@Test
	@Ignore
	public void springIoc() {
		ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring-context.xml");
		TestSpringIocController test = (TestSpringIocController) context.getBean("test");
		test.print();
	}

	@Test
	@Ignore
	// 测试Spring IOC的开发环境
	public void save() {
		java.util.Random r=new java.util.Random(); 
		for(int i =100 ; i < 10000 ; i++){
			User user = new User();
			user.setUsername("skyLine"+i);
			user.setPassword(r.nextInt()+"");
			userDao.store(user);
			User user2 = userDao.findOneByUsername("skyLine"+i);
			logger.info("-------获取账户:-------" + user2.getUsername());
			logger.info("-------获取账户密码:-------" + user2.getPassword());
		}
		
	}

	@Test
	@Ignore
	public void update() {
		User user = userDao.findOneByUsername("skyLine5");
		if(user!=null){
			logger.info("-------更新之前账户密码:-------" + user.getPassword());
			user.setPassword("9999888");
			userDao.updateFirst(user);
			logger.info("-------更新之后账户密码:-------" + user.getPassword());
		}
	}

	@Test
	@Ignore
	// 测试Spring IOC的开发环境
	public void findAll() {
		 List<User> lists = userDao.findAll();
		 for (User user : lists) {
			 logger.info("-------user遍历:-------" + user.getUsername());
		 }
		/*-
		List<User> lists2 = userDao.findList(1, 2);
		for (User user : lists2) {
			logger.info("-------user遍历:-------" + user.getUsername());
		}*/
	}

	@Test
	public void delete() {
		for(int i =1000 ; i < 2000 ; i++){
			User user = userDao.findOneByUsername("skyLine"+i);
			if(user!=null){
				logger.info("id: "+user.getId());
				logger.info("username: "+user.getUsername());
				logger.info("password: "+user.getPassword());
				userDao.delete(user.getId());
			}else{
				logger.info("user  skyLine"+i+" is null.");
			}
		}
	}

}
