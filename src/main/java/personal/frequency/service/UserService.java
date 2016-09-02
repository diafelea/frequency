package personal.frequency.service;

import personal.frequency.model.User;

public interface UserService {

	public void save(User user);
	
	public boolean accountAlreadyExists(String username, String email);

}
