package cn.itcast.web.action;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.itcast.domain.Customer;
import cn.itcast.domain.SaleVisit;
import cn.itcast.domain.User;
import cn.itcast.service.SaleVisitService;
import cn.itcast.utils.PageBean;

public class SaleVisitAction extends ActionSupport implements ModelDriven<SaleVisit>{
	private SaleVisit saleVisit = new SaleVisit() ;
	
	private SaleVisitService svs;
	

	/**
	 * 添加客户访问记录
	 * @return
	 * @throws Exception
	 */
	public String add() throws Exception {
		//1.获取session中的user，封装到saleVisit
		User user = (User) ActionContext.getContext().getSession().get("user");
		saleVisit.setUser(user);
		//2.执行service的save方法
		svs.save(saleVisit);
		//3.重定向到客户列表页面。
		return "toList";
	}
	/**查看客户访问记录
	 * @return
	 * @throws Exception
	 */
	// 使用域属性注入
		private Integer currentPage;
		private Integer pageSize;

		public String list() throws Exception {
			// 1.封装离线查询对象
			DetachedCriteria dc = DetachedCriteria.forClass(SaleVisit.class);
			// 2.判断并封装参数
			if (saleVisit.getCustomer()!=null&& saleVisit.getCustomer().getCust_id()!=null) {
				dc.add(Restrictions.eq("customer.cust_id", saleVisit.getCustomer().getCust_id()));
			}
			// 3.调用service查询分页数据
			PageBean pb = svs.getPageBean(dc, currentPage, pageSize);
			// 4. 将pageBean放入request域中，转发到列表页面显示
			ActionContext.getContext().put("pageBean", pb);
			return "list";
		}
		

		//去往编辑页面回显
		public String toEdit() throws Exception {
				//1 调用Service根据id查询客户拜访对象
				SaleVisit sv = svs.getById(saleVisit.getVisit_id());
				//2 将对象放入request域
				ActionContext.getContext().put("saleVisit", sv);
				//3 转发到add.jsp
				return "add";
		}


	public void setSvs(SaleVisitService svs) {
		this.svs = svs;
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


	@Override
	public SaleVisit getModel() {
		return saleVisit;
	}

}
