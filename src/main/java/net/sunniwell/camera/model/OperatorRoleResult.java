package net.sunniwell.camera.model;

import java.util.List;

/**
 * 
 * @ClassName: OperatorRoleResult 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 * @author A18ccms a18ccms_gmail_com 
 * @date 2017年5月5日 下午3:29:17 
 *
 */
public class OperatorRoleResult {
	
	private Integer page = 1;//当前页
	
	private Integer pageSize = 10;//每页显示条数
	
	private Integer total;//总条数
	
	private List<OperatorRole> roleList;//结果集
	
	private Integer totalCount;//总页数
	
	public Integer getTotalCount() {
		return (int)Math.ceil(total*1.0/pageSize);
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public List<OperatorRole> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<OperatorRole> roleList) {
		this.roleList = roleList;
	}
	
	
}
