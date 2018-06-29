package team.smart.dao;

import java.util.Map;
import java.util.List;
import team.smart.model.Meal;

public interface MealMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(Meal record);

    int insertSelective(Meal record);

    Meal selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(Meal record);

    int updateByPrimaryKey(Meal record);
    
    //add by lyd
    int getTotalRow(Map<String, Object> map);
    
    List<Meal> getMealRange(Map<String, Object> map);
    
	List<Meal> getAllMealRange(Map<String, Object> map);
	
	List<Meal> getAll(Map<String , Object> map);
}