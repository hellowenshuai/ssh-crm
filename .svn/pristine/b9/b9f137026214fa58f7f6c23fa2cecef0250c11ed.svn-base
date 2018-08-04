package cn.itcast.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import cn.itcast.dao.LinkManDao;
import cn.itcast.domain.Customer;
import cn.itcast.domain.LinkMan;
import cn.itcast.service.LinkManService;
import cn.itcast.utils.PageBean;

public class LinkManServiceImpl implements LinkManService {

	private LinkManDao lmd;
	
	public void setLmd(LinkManDao lmd) {
		this.lmd = lmd;
	}
	
	@Override
	public void save(LinkMan linkMan) {
		lmd.saveOrUpdate(linkMan);
	}
	
	@Override
	public PageBean getPageBean(DetachedCriteria dc, Integer currentPage, Integer pageSize) {
		//1.查询总记录数
		Integer totalCount = lmd.getTotalCount(dc);
		//2.创建pageBean对象
		PageBean pb = new PageBean(currentPage,totalCount,pageSize);
		//3.查询分页列表数据
		List<LinkMan> list=lmd.getPageList(dc,pb.getStart(),pb.getPageSize());
		//4.将列表数据放入到pageBean中
		pb.setList(list);
		return pb;
	}

	@Override
	public LinkMan getById(Long lkm_id) {
		return lmd.getById(lkm_id);
	}

}
