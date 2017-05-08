package net.sunniwell.camera.amq;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

/** 
 * @author  763915703@qq.com
 * @date 创建时间：2017年5月5日 上午11:32:31 
 * @version 1.0 
 * @since  
 * @description  
 */
public class MessageReceiver implements MessageListener {

	@Override
	public void onMessage(Message message) {
		if(message instanceof TextMessage) {
            TextMessage textMessage = (TextMessage) message;
            try {
                String text = textMessage.getText();
                System.out.println(String.format("Received: %s",text));
            } catch (JMSException e) {
                e.printStackTrace();
            }
        }
	}

}
