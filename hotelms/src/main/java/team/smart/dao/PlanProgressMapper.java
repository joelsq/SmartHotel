package team.smart.dao;

import java.util.HashMap;
import java.util.List;

import team.smart.model.PlanProgress;

public interface PlanProgressMapper {
	int deleteByPrimaryKey(Integer ID);

	int insert(PlanProgress record);

	int insertSelective(PlanProgress record);

	PlanProgress selectByPrimaryKey(Integer ID);

	int updateByPrimaryKeySelective(PlanProgress record);

	int updateByPrimaryKey(PlanProgress record);
	
	//add
    int getTotalByPlanId(Integer PID);
    
    List<PlanProgress> getPlanProgresses(HashMap<String, Object> map);
}