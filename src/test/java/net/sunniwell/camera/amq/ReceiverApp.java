package net.sunniwell.camera.amq;

import org.springframework.context.support.ClassPathXmlApplicationContext;

/** 
 * @author  763915703@qq.com
 * @date 创建时间：2017年5月5日 上午11:36:16 
 * @version 1.0 
 * @since  
 * @description  
 */
public class ReceiverApp {

	public static void main(String[] args) {
		ClassPathXmlApplicationContext classPathXmlApplicationContext = new ClassPathXmlApplicationContext("springJMSConfiguration.xml", "springJMSReceiver.xml");
		MessageReceiver bean = (MessageReceiver) classPathXmlApplicationContext.getBean("messageReceiver");
		int code = bean.hashCode();
		System.out.println(code);
		
	}

}
