package personal.frequency.dao.impl;

import org.springframework.stereotype.Repository;

import personal.frequency.dao.RoleDAO;
import personal.frequency.model.Role;
import personal.frequency.utils.CustomHibernateDaoSupport;

@Repository
public class RoleDAOImpl extends CustomHibernateDaoSupport implements RoleDAO {

	@Override
	public void save(Role role) {
		getHibernateTemplate().save(role);
	}

}
