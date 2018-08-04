package cn.itcast.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

public interface BaseDao<T> {
	//增或者修改
	void saveOrUpdate(T t);
	//增
	void save(T t);
	//删 依据类
	void delete(T t);
	//删 依据id Serializable作为数字顶层接口
	void delete(Serializable id);
	//改
	void update(T t);
	//查 依据id
	T getById(Serializable id);
	//查 符号条件的总记录数
	Integer getTotalCount(DetachedCriteria dc);
	//查 查询分页列表数据
	List<T> getPageList(DetachedCriteria dc,Integer start,Integer pageSize);

}
