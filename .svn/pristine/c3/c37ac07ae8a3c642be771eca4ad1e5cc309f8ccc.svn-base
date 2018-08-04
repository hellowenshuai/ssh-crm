package cn.itcast.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import cn.itcast.domain.Customer;
import cn.itcast.utils.PageBean;

public interface CustomerService {

	PageBean getPageBean(DetachedCriteria dc, Integer currentPage, Integer pageSize);

	void save(Customer customer);

	Customer getById(Long cust_id);
	
	List<Object[]> getIndustryCount();
	
	List<Object[]> getSourceCount();

}
