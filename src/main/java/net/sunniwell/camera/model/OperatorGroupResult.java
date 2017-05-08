package net.sunniwell.camera.model;

import java.util.List;

/**
 * 组的结果集(含分页)
 * @author wanglei
 */
public class OperatorGroupResult  {
	private Integer page = 1;//当前页
	
	private Integer pageSize = 10;//每页显示条数
	
	private Integer total;//总条数
	
	private List<OperatorGroup> groupList;//结果集
	
	private Integer totalCount;//总页数
	
	public Integer getTotalCount() {
		return (int)Math.ceil(total*1.0/pageSize);
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
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

	public List<OperatorGroup> getGroupList() {
		return groupList;
	}

	public void setGroupList(List<OperatorGroup> groupList) {
		this.groupList = groupList;
	}
}
