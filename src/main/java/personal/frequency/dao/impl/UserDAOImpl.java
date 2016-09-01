package personal.frequency.dao.impl;

import org.springframework.stereotype.Repository;

import personal.frequency.dao.UserDAO;
import personal.frequency.model.User;
import personal.frequency.utils.CustomHibernateDaoSupport;

@Repository
public class UserDAOImpl extends CustomHibernateDaoSupport implements UserDAO {

	@Override
	public void save(User user) {
		getHibernateTemplate().save(user);
	}

}
