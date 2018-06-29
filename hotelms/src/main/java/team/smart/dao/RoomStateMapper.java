package team.smart.dao;

import java.util.List;

import team.smart.model.RoomState;

public interface RoomStateMapper {
	int deleteByPrimaryKey(Integer ID);

	int insert(RoomState record);

	int insertSelective(RoomState record);

	RoomState selectByPrimaryKey(Integer ID);

	int updateByPrimaryKeySelective(RoomState record);

	int updateByPrimaryKey(RoomState record);

	// add

	List<RoomState> getAllRoomState();

	List<RoomState> getTotalRoomState();
	
	RoomState getCertainRoomStateByID(Integer RID);
	
	RoomState getCertainRoomStateByNumber(String RN);

	RoomState getCertainRoomStateByRoomNumber(String RN);
}