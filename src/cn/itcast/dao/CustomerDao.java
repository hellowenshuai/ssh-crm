package cn.itcast.dao;


import java.util.List;

import cn.itcast.domain.Customer;

public interface CustomerDao extends BaseDao<Customer> {
	
	List<Object[]> getIndustryCount();
	List<Object[]> getSourceCount();


}
