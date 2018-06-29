package team.smart.dao;

import java.util.HashMap;
import java.util.List;

import team.smart.model.GroceryRunning;

public interface GroceryRunningMapper {
	int deleteByPrimaryKey(Integer ID);

	int insert(GroceryRunning record);

	int insertSelective(GroceryRunning record);

	GroceryRunning selectByPrimaryKey(Integer ID);

	int updateByPrimaryKeySelective(GroceryRunning record);

	int updateByPrimaryKey(GroceryRunning record);
	
	//add
	
	int totalRec(HashMap<String, Object> map);
	
	List<GroceryRunning> getRec(HashMap<String, Object> map);
}