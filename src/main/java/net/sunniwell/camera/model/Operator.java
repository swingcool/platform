package net.sunniwell.camera.model;

import java.io.Serializable;
import java.util.Map;

/** 
 * @author  763915703@qq.com
 * @date 创建时间：2017年5月5日 下午2:46:04 
 * @version 1.0 
 * @since  
 * @description  
 */
public class Operator implements Serializable{
	private static final long serialVersionUID = 1L;
	
    private String id;

    //权限ID
    private Integer roleId;

    //分组ID
    private Integer groupId;

    private String password;

    private String phone;

    private String addr;

    private Long loginUtc;

    private String creater;

    private String question;

    private String answer;

    private String email;

    //操作员分组对象
    private OperatorGroup operatorGroup;
    
    //操作员权限对象
    private OperatorRole operatorRole;
    
    private Map<String , String> ids;

	public void setIds(Map<String, String> ids) {
		this.ids = ids;
	}

	public Map<String, String> getIds() {
		return ids;
	}

	public OperatorGroup getOperatorGroup() {
		return operatorGroup;
	}

	public void setOperatorGroup(OperatorGroup operatorGroup) {
		this.operatorGroup = operatorGroup;
	}

	public OperatorRole getOperatorRole() {
		return operatorRole;
	}

	public void setOperatorRole(OperatorRole operatorRole) {
		this.operatorRole = operatorRole;
	}


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr == null ? null : addr.trim();
    }

    public Long getLoginUtc() {
        return loginUtc;
    }

    public void setLoginUtc(Long loginUtc) {
        this.loginUtc = loginUtc;
    }

    public String getCreater() {
        return creater;
    }

    public void setCreater(String creater) {
        this.creater = creater == null ? null : creater.trim();
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question == null ? null : question.trim();
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer == null ? null : answer.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

	@Override
	public String toString() {
		return "Operators [id=" + id + ", roleId=" + roleId + ", groupId=" + groupId + ", password=" + password
				+ ", phone=" + phone + ", addr=" + addr + ", loginUtc=" + loginUtc + ", creater=" + creater
				+ ", question=" + question + ", answer=" + answer + ", email=" + email 
				+ ", operatorGroup=" + operatorGroup + ", operatorRole=" + operatorRole
				+ ", ids=" + ids + "]";
	}
}
