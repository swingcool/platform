package net.sunniwell.camera.amq;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.util.StringUtils;

/**
 * @author 763915703@qq.com
 * @date 创建时间：2017年5月5日 上午11:33:52
 * @version 1.0
 * @since
 * @description
 */
public class SenderApp {

	public static void main(String[] args) {
		try {
			MessageSender sender = getMessageSender();
			BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
			String text = br.readLine();
			while (!StringUtils.isEmpty(text)) {
				System.out.println(String.format("send message: %s", text));
				sender.send(text);
				text = br.readLine();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public static MessageSender getMessageSender() {
		ApplicationContext context = new ClassPathXmlApplicationContext("springJMSConfiguration.xml");
		return (MessageSender) context.getBean("messageSender");
	}
}
