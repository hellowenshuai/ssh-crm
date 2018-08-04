package cn.itcast.service;

import org.hibernate.criterion.DetachedCriteria;

import cn.itcast.domain.User;
import cn.itcast.utils.PageBean;

public interface UserService {
	//登陆方法
	User	getUserByCodePassword(User u);
	//注册用户
	void saveUser(User u);
	PageBean getPageBean(DetachedCriteria dc, Integer currentPage, Integer pageSize);
	User getById(Long user_id);
	void deleteById(Long user_id);
}
