package cn.itcast.web.action;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.itcast.domain.Customer;
import cn.itcast.service.CustomerService;
import cn.itcast.utils.PageBean;

@Controller("customerAction")
@Scope("prototype")

public class CustomerAction extends ActionSupport implements ModelDriven<Customer> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Resource(name="customerService")
	private CustomerService cs;
	// 使用模型对象注入
	private Customer customer = new Customer();
	
	//上传的文件会自动封装到File对象
	//在后台提供一个与前台input type=file组件 name相同的属性
	private File photo;
	
	//在提交键名后加上固定后缀FileName,文件名称会自动封装到属性中
	private String photoFileName;
	
	//在提交键名后加上固定后缀ContentType,文件MIME类型会自动封装到属性中
	private String photoContentType;


	// 使用域属性注入
	private Integer currentPage;
	private Integer pageSize;

	public String list() throws Exception {
		// 1.封装离线查询对象
		DetachedCriteria dc = DetachedCriteria.forClass(Customer.class);
		// 2.判断并封装参数
		if (StringUtils.isNotBlank(customer.getCust_name())) {
			dc.add(Restrictions.like("cust_name", "%" + customer.getCust_name() + "%"));
		}
		// 3.调用service查询分页数据
		PageBean pb = cs.getPageBean(dc, currentPage, pageSize);
		// 4. 将pageBean放入request域中，转发到列表页面显示
		ActionContext.getContext().put("pageBean", pb);
		return "list";
	}

	public String add() throws Exception {
		//将文件保存到指定文件下
		if(photo!=null) {
			System.out.println("文件名称"+photoFileName);
			System.out.println("文件类型"+photoContentType);
			photo.renameTo(new File("E:/upload/haha.jpg"));
		}
		
		//1.调用service执行保存操作
		cs.save(customer);
		//2.重定向到客户列表
		return "toList";
	}
	
	public String toEdit() throws Exception {
		
		//1.调用service使用id获得客户对象
		Customer c = cs.getById(customer.getCust_id());
		//2.将客户对象放入request，转发到编辑页面
		ActionContext.getContext().put("customer", c);
		return "edit";
	}
	
	public String industryCount() throws Exception {
		
		//1.调用service使用id获得客户对象
		List<Object[]> list = cs.getIndustryCount();
		//2.将客户对象放入request，转发到编辑页面
		ActionContext.getContext().put("list", list);
		return "industryCount";
	}
	public String sourceCount() throws Exception {
		
		//1.调用service使用id获得客户对象
		List<Object[]> list = cs.getSourceCount();
		//2.将客户对象放入request，转发到编辑页面
		ActionContext.getContext().put("list", list);
		return "sourceCount";
	}

	@Override
	public Customer getModel() {
		return customer;
	}
	public void setCs(CustomerService cs) {
		this.cs = cs;
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

	public File getPhoto() {
		return photo;
	}

	public void setPhoto(File photo) {
		this.photo = photo;
	}

	public String getPhotoFileName() {
		return photoFileName;
	}

	public void setPhotoFileName(String photoFileName) {
		this.photoFileName = photoFileName;
	}

	public String getPhotoContentType() {
		return photoContentType;
	}

	public void setPhotoContentType(String photoContentType) {
		this.photoContentType = photoContentType;
	}
	
	

}
