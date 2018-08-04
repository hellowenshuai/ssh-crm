package cn.itcast.service.impl;

import java.util.List;

import cn.itcast.dao.BaseDictDao;
import cn.itcast.domain.BaseDict;
import cn.itcast.service.BaseDictService;

public class BaseDictServiceImpl implements BaseDictService {

	private BaseDictDao baseDictDao;
	
	public void setBaseDictDao(BaseDictDao baseDictDao) {
		this.baseDictDao = baseDictDao;
	}

	@Override
	public List<BaseDict> getListByTypeCode(String dict_type_code) {
		
		return baseDictDao.getListByTypeCode(dict_type_code);
	}

}
