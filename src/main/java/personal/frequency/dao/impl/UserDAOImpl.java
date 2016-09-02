package personal.frequency.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
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

	@SuppressWarnings("unchecked")
	public List<User> accountAlreadyExists(final String username, final String email) {
		List<User> list = (List<User>)getHibernateTemplate().execute(new HibernateCallback<Object>() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				StringBuilder hql = new StringBuilder();
				hql.append(" select user from User user ");
				hql.append(" where user.username = :usernameParam or user.email = :emailParam");
				Query query = session.createQuery(hql.toString());
				query.setParameter("usernameParam", username);
				query.setParameter("emailParam", email);
				return query.list();
			}
		});
		return list;
	}

}
