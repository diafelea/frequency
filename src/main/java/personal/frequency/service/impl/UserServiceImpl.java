package personal.frequency.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import personal.frequency.dao.UserDAO;
import personal.frequency.model.Role;
import personal.frequency.model.User;
import personal.frequency.service.RoleService;
import personal.frequency.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	@Autowired
	private RoleService roleService;

	public void save(User user) {
		userDAO.save(user);
		roleService.save(Role.addUserRole(user, false));
	}

	public boolean accountAlreadyExists(String username, String email) {
		List<User> users = userDAO.accountAlreadyExists(username, email);
		return users != null && !users.isEmpty() ? true : false;
	}

}
