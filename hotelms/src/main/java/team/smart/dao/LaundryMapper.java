package team.smart.dao;

import java.util.HashMap;
import java.util.List;

import team.smart.model.Laundry;

public interface LaundryMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(Laundry record);

    int insertSelective(Laundry record);

    Laundry selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(Laundry record);

    int updateByPrimaryKey(Laundry record);
    
    //add
    Integer totalRec(HashMap<String, Object> map);
    
    List<Laundry> getAll(HashMap<String, Object> map);
    
    List<Laundry> getRec(HashMap<String, Object> map);
    
    Laundry getCertainRec(HashMap<String, Object> map);
    
    
}