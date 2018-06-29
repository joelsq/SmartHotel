package team.smart.service;

import java.util.List;

import team.smart.model.User;

public interface UserService {

	// 根据用户id查询用户
	User getUserById(int id);

	// 根据用户名查询用户
	User getUserByUserName(String name);

	// 插入一个用户
	int insert(User userInfo);

	int updateUserInfo(User userInfo);

	List<User> selectUserRange(int st, int each);

	int totalRow();

	//获取所有用户
	List<User> getAllUsers();
}
