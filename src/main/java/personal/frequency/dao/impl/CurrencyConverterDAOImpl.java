package personal.frequency.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import personal.frequency.dao.CurrencyConverterDAO;
import personal.frequency.model.CurrencyConverter;
import personal.frequency.utils.CustomHibernateDaoSupport;

@Repository
public class CurrencyConverterDAOImpl extends CustomHibernateDaoSupport implements CurrencyConverterDAO {

	private static final int MAX_ROWS = 10;
	
	@Override
	public void save(CurrencyConverter currencyConverter) {
		getHibernateTemplate().save(currencyConverter);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CurrencyConverter> getConversionResultsByUser(final String username) {
		List<CurrencyConverter> list = (List<CurrencyConverter>)getHibernateTemplate().execute(new HibernateCallback<Object>() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				StringBuilder hql = new StringBuilder();
				hql.append(" select res from CurrencyConverter res ");
				hql.append(" where res.username = :usernameParam order by res.id DESC");
				Query query = session.createQuery(hql.toString());
				query.setParameter("usernameParam", username);
				query.setMaxResults(MAX_ROWS);
				return query.list();
			}
		});
		return list;
	}

}
