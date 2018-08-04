package cn.itcast.service;

import org.hibernate.criterion.DetachedCriteria;

import cn.itcast.domain.SaleVisit;
import cn.itcast.utils.PageBean;

public interface SaleVisitService {
	//保存客户访问记录
	void save(SaleVisit saleVisit);

	PageBean getPageBean(DetachedCriteria dc, Integer currentPage, Integer pageSize);

	SaleVisit getById(String visit_id);

}
