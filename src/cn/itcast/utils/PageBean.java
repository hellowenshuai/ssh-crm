package cn.itcast.utils;

import java.util.List;

public class PageBean {
	// 当前页数（currentPage） 前台传入
	private Integer currentPage;
	// 总记录数（totalCount） 调用dao
	private Integer totalCount;
	// 每页显示条数（pageSize） 前台传入
	private Integer pageSize;
	// 总页数（totalPage） 由总记录数和每页显示条数计算
	private Integer totalPage;
	// 客户列表（list） 调用dao
	private List list;

	public PageBean(Integer currentPage, Integer totalCount, Integer pageSize) {
		super();
		this.totalCount = totalCount;

		this.currentPage = currentPage;
		if (this.currentPage == null) {
			// 如果页面没有指定显示那一页，默认显示第一页
			this.currentPage = 1;
		}

		this.pageSize = pageSize;

		if (this.pageSize == null) {
			// 如果页面没有指定每页显示条数，默认第一页显示3条
			this.pageSize = 3;
		}
		// 计算总页数
		this.totalPage = (this.totalCount + this.pageSize - 1) / this.pageSize;
		// 判断当前页数是否超出范围
		// 不能小于1
		if (this.currentPage < 1) {
			this.totalPage = 1;
		}
		// 不能大于总页数
		if (this.currentPage > this.totalPage) {
			this.currentPage = this.totalPage;
		}
	}
	//计算起始索引
	public Integer getStart() {
		return (this.currentPage-1)*this.pageSize;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

}
