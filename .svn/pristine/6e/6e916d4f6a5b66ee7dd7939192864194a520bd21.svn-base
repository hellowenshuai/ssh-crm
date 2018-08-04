package cn.itcast.web.action;

import java.io.File;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.itcast.domain.Customer;
import cn.itcast.domain.LinkMan;
import cn.itcast.service.LinkManService;
import cn.itcast.utils.PageBean;

public class LinkManAction extends ActionSupport implements ModelDriven<LinkMan> {
	// 使用模型对象注入
	private LinkMan linkMan = new LinkMan();
	private LinkManService lms;

	// 使用域属性注入
	private Integer currentPage;
	private Integer pageSize;

	public String list() throws Exception {
		// 1.封装离线查询对象
		DetachedCriteria dc = DetachedCriteria.forClass(LinkMan.class);
		// 2.判断并封装参数
		if (StringUtils.isNotBlank(linkMan.getLkm_name())) {
			dc.add(Restrictions.like("lkm_name", "%" + linkMan.getLkm_name() + "%"));
		}
		if (linkMan.getCustomer() != null && linkMan.getCustomer().getCust_id() != null) {
			dc.add(Restrictions.eq("customer.cust_id", linkMan.getCustomer().getCust_id()));
		}
		// 3.调用service查询分页数据
		PageBean pb = lms.getPageBean(dc, currentPage, pageSize);
		// 4. 将pageBean放入request域中，转发到列表页面显示
		ActionContext.getContext().put("pageBean", pb);
		return "list";
	}

	public String add() throws Exception {

		// 1.调用service执行保存操作
		lms.save(linkMan);
		// 2.重定向到客户列表
		return "toList";
	}

	public String toEdit() throws Exception {

		// 1.调用service使用id获得客户对象
		LinkMan lm = lms.getById(linkMan.getLkm_id());
		// 2.将客户对象放入request，转发到编辑页面
		ActionContext.getContext().put("linkMan", lm);
		return "edit";
	}

	public void setLms(LinkManService lms) {
		this.lms = lms;
	}

	@Override
	public LinkMan getModel() {
		return linkMan;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

}
