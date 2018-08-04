package cn.itcast.dao;

import java.util.List;

import cn.itcast.domain.BaseDict;

public interface BaseDictDao extends BaseDao<BaseDict>{

	List<BaseDict> getListByTypeCode(String dict_type_code);

}
