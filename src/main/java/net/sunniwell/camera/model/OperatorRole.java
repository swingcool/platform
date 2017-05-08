package net.sunniwell.camera.model;

import java.io.Serializable;

/**
 * 
 * @ClassName: OperatorRole 
 * @Description: 权限对象
 * @author A18ccms a18ccms_gmail_com 
 * @date 2017年5月5日 下午3:28:39 
 *
 */
public class OperatorRole implements Serializable {
    private Integer idx;

    private String name;

    private String creater;

    private String permission;

    private static final long serialVersionUID = 1L;

    public Integer getIdx() {
        return idx;
    }

    public void setIdx(Integer idx) {
        this.idx = idx;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getCreater() {
        return creater;
    }

    public void setCreater(String creater) {
        this.creater = creater == null ? null : creater.trim();
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission == null ? null : permission.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", idx=").append(idx);
        sb.append(", name=").append(name);
        sb.append(", creater=").append(creater);
        sb.append(", permission=").append(permission);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}