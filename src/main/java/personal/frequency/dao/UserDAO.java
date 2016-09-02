package personal.frequency.dao;

import java.util.List;

import personal.frequency.model.User;

public interface UserDAO {

	public void save(User user);
	
	public List<User> accountAlreadyExists(final String username, final String email);

}
