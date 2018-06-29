package team.smart.dao;

import java.util.HashMap;
import java.util.List;

import team.smart.model.User;

public interface UserMapper {
	int deleteByPrimaryKey(Integer ID);

	int insert(User record);

	int insertSelective(User record);

	User selectByPrimaryKey(Integer ID);

	int updateByPrimaryKeySelective(User record);

	int updateByPrimaryKey(User record);

	// add

	User selectByUserName(String USERNAME);

	List<User> selectIdRange(HashMap<String, Integer> map);

	int totalRow();

	List<User> selectAll();
}