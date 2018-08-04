package cn.itcast.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.dao.BaseDictDao;
import cn.itcast.domain.BaseDict;
import cn.itcast.service.BaseDictService;
@Transactional(isolation=Isolation.REPEATABLE_READ,propagation=Propagation.REQUIRED,readOnly=false)
@Service("baseDictService")
public class BaseDictServiceImpl implements BaseDictService {
	@Resource(name="baseDictDao")
	private BaseDictDao baseDictDao;
	
	public void setBaseDictDao(BaseDictDao baseDictDao) {
		this.baseDictDao = baseDictDao;
	}

	@Override
	public List<BaseDict> getListByTypeCode(String dict_type_code) {
		
		return baseDictDao.getListByTypeCode(dict_type_code);
	}

}
