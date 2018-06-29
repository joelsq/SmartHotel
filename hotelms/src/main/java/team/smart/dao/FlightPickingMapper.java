package team.smart.dao;

import java.util.HashMap;
import java.util.List;

import team.smart.model.FlightPicking;

public interface FlightPickingMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(FlightPicking record);

    int insertSelective(FlightPicking record);

    FlightPicking selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(FlightPicking record);

    int updateByPrimaryKey(FlightPicking record);
    
    //add
    int getTotalByRoomNumber_Time(HashMap<String, Object> map);
    
    List<FlightPicking> getAll(HashMap<String, Object> map);
    
    List<FlightPicking> selectByRoomNumber_Time(HashMap<String, Object> map);
}