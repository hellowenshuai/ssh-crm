package cn.itcast.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.dao.UserDao;
import cn.itcast.domain.Customer;
import cn.itcast.domain.User;
import cn.itcast.service.UserService;
import cn.itcast.utils.MD5Utils;
import cn.itcast.utils.PageBean;

@Transactional(isolation=Isolation.REPEATABLE_READ,propagation=Propagation.REQUIRED,readOnly=false)
@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Resource(name="userDao")
	private UserDao ud;
	
	@Override
	public PageBean getPageBean(DetachedCriteria dc, Integer currentPage, Integer pageSize) {
		//1.查询总记录数
		Integer totalCount = ud.getTotalCount(dc);
		//2.创建pageBean对象
		PageBean pb = new PageBean(currentPage,totalCount,pageSize);
		//3.查询分页列表数据
		List<User> list=ud.getPageList(dc,pb.getStart(),pb.getPageSize());
		//4.将列表数据放入到pageBean中
		pb.setList(list);
		return pb;
	}


	
	@Override
	public User getUserByCodePassword(User u) {
			//1 根据登陆名称查询登陆用户
			User existU = ud.getByUserCode(u.getUser_code());
			//2 判断用户是否存在.不存在=>抛出异常,提示用户名不存在
			if(existU==null){
				throw new RuntimeException("用户名不存在!");
			}
			//3 判断用户密码是否正确=>不正确=>抛出异常,提示密码错误
			if(!existU.getUser_password().equals(MD5Utils.md5(u.getUser_password()))){
				throw new RuntimeException("密码错误!");
			}
			//4 返回查询到的用户对象
		
		return existU;
	}

	@Override
	@Transactional(isolation=Isolation.REPEATABLE_READ,propagation=Propagation.REQUIRED,readOnly=false)
	public void saveUser(User u) {
		//1 根据登陆名称查询登陆用户
		if(u.getUser_id()==null) {
			User existU = ud.getByUserCode(u.getUser_code());
			//2 判断用户是否存在.存在=>抛出异常,提示用户名存在
			if(existU!=null){
				throw new RuntimeException("用户名已经存在!");
			}
			
		}
		//md5加密
		u.setUser_password(MD5Utils.md5(u.getUser_password()));
		ud.saveOrUpdate(u);
	}

	public void setUd(UserDao ud) {
		this.ud = ud;
	}



	@Override
	public User getById(Long user_id) {
		return ud.getById(user_id);
	}



	@Override
	public void deleteById(Long user_id) {
		ud.delete(user_id);
	}

}
