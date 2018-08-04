package cn.itcast.dao.impl;


import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;

import cn.itcast.dao.CustomerDao;
import cn.itcast.domain.Customer;

public class CustomerDaoImpl extends BaseDaoImpl<Customer> implements CustomerDao {

	/*
	 * select bd.dict_item_name,COUNT(*) total
		FROM base_dict bd ,cst_customer c
		WHERE c.cust_industry=bd.dict_id
		GROUP BY c.cust_industry;
	 * 
	 * 
	 * */
	@Override
	public List<Object[]> getIndustryCount() {
		@SuppressWarnings("unchecked")
		List<Object[]> list = getHibernateTemplate().execute(new HibernateCallback<List>() {
			String sql = "select bd.dict_item_name,COUNT(*) total\r\n" + 
					"FROM base_dict bd ,cst_customer c\r\n" + 
					"WHERE c.cust_industry=bd.dict_id\r\n" + 
					"GROUP BY c.cust_industry;";

			@Override
			public List doInHibernate(Session session) throws HibernateException {
					SQLQuery query = session.createSQLQuery(sql);
				return query.list();
			}
		});
		
		return list;
	}

	@Override
	public List<Object[]> getSourceCount() {
		@SuppressWarnings("unchecked")
		List<Object[]> list = getHibernateTemplate().execute(new HibernateCallback<List>() {
			String sql = "SELECT bd.dict_item_name,COUNT(*)\r\n" + 
					"FROM cst_customer c ,base_dict bd\r\n" + 
					"where c.cust_source= bd.dict_id\r\n" + 
					"GROUP BY c.cust_source;";

			@Override
			public List doInHibernate(Session session) throws HibernateException {
					SQLQuery query = session.createSQLQuery(sql);
				return query.list();
			}
		});
		
		return list;
	}

}
