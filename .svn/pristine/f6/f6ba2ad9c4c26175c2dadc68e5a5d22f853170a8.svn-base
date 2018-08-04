package cn.itcast.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import cn.itcast.dao.SaleVisitDao;
import cn.itcast.domain.Customer;
import cn.itcast.domain.SaleVisit;
import cn.itcast.service.SaleVisitService;
import cn.itcast.utils.PageBean;

public class SaleVisitServiceImpl implements SaleVisitService {

	private SaleVisitDao svd;

	@Override
	public void save(SaleVisit saleVisit) {
		svd.save(saleVisit);
	}

	public void setSvd(SaleVisitDao svd) {
		this.svd = svd;
	}

	@Override
	public PageBean getPageBean(DetachedCriteria dc, Integer currentPage, Integer pageSize) {
		// 1.查询总记录数
		Integer totalCount = svd.getTotalCount(dc);
		// 2.创建pageBean对象
		PageBean pb = new PageBean(currentPage, totalCount, pageSize);
		// 3.查询分页列表数据
		List<SaleVisit> list = svd.getPageList(dc, pb.getStart(), pb.getPageSize());
		// 4.将列表数据放入到pageBean中
		pb.setList(list);
		return pb;
	}

	@Override
	public SaleVisit getById(String visit_id) {
		return svd.getById(visit_id);
	}

}
