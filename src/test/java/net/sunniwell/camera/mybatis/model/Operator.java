package net.sunniwell.camera.mybatis.model;

/**
 * @author 763915703@qq.com
 * @date 创建时间：2017年4月26日 下午2:55:49
 * @version 1.0
 * @description 操作员表实体对象
 */
public class Operator {
	private int id;
	private String username;
	private String password;
	private boolean administrator;

	public int getId() {
		return id;
	}

	public void setId(int id) {
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

	public boolean isAdministrator() {
		return administrator;
	}

	public void setAdministrator(boolean administrator) {
		this.administrator = administrator;
	}

}
