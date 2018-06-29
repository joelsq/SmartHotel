package team.smart.dao;

import java.util.List;
import java.util.Map;

import team.smart.model.DrinkingWater;


public interface DrinkingWaterMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(DrinkingWater record);

    int insertSelective(DrinkingWater record);

    DrinkingWater selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(DrinkingWater record);

    int updateByPrimaryKey(DrinkingWater record);
    
    //add
    DrinkingWater selectLastByGid(Integer gid);
    DrinkingWater selectLastBeforeByGidAndTime(Map<String, Object> map);
    int selectTotal(Map<String, Object> map);
    List<DrinkingWater> selectByPage(Map<String, Object> map);
    List<DrinkingWater> selectAll(Map<String, Object> map);
    int updateAfterTime(Map<String, Object> map);
}