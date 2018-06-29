package team.smart.dao;

import java.util.HashMap;
import java.util.List;

import team.smart.model.Plan;

public interface PlanMapper {
	int deleteByPrimaryKey(Integer ID);

	int insert(Plan record);

	int insertSelective(Plan record);

	Plan selectByPrimaryKey(Integer ID);

	int updateByPrimaryKeySelective(Plan record);

	int updateByPrimaryKey(Plan record);

	// add
	List<Plan> getPlans(HashMap<String, Integer> map);

	int getTotal();

	Plan selectByName(String NAME);
}