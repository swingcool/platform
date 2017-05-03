package net.sunniwell.camera.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * @author 763915703@qq.com
 * @date 创建时间：2017年4月24日 下午3:38:28
 * @version 1.0
 * @since
 * @description
 */
@Document(collection = "sky.user")
public class User {
	@Id
	private String id;

	private String username;

	private String password;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
