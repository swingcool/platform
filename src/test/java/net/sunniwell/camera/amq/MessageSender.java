package net.sunniwell.camera.amq;

import org.springframework.jms.core.JmsTemplate;

/**
 * @author 763915703@qq.com
 * @date 创建时间：2017年5月5日 上午10:38:04
 * @version 1.0
 * @since
 * @description
 */
public class MessageSender {
	private final JmsTemplate jmsTemplate;

	public MessageSender(final JmsTemplate jmsTemplate) {
		this.jmsTemplate = jmsTemplate;
	}

	public void send(final String text) {
		jmsTemplate.convertAndSend(text);
	}
}
