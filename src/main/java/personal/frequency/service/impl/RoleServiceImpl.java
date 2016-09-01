package personal.frequency.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import personal.frequency.dao.RoleDAO;
import personal.frequency.model.Role;
import personal.frequency.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleDAO roleDAO;
	
	@Override
	public void save(Role role) {
		roleDAO.save(role);
	}

}
