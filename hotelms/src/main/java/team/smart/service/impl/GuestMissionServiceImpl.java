package team.smart.service.impl;

//import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import team.smart.dao.GuestBalanceMapper;
import team.smart.dao.GuestMapper;
import team.smart.dao.GuestServiceMapper;
import team.smart.dao.HostMapper;
import team.smart.dao.InternMapper;
import team.smart.model.Guest;
import team.smart.model.GuestBalance;
import team.smart.model.GuestService;
import team.smart.model.Host;
import team.smart.model.Intern;
import team.smart.service.GuestMissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/* 用户service实现类  */
@Service("guestService")
public class GuestMissionServiceImpl implements GuestMissionService {

	private static Logger logger = Logger.getLogger("logDev");

	@Autowired
	private GuestMapper guestMapper;

	@Autowired
	private HostMapper hostMapper;
	
	@Autowired
	private InternMapper internMapper;
	
	@Autowired
	private GuestBalanceMapper guestBalanceMapper;
	
	@Autowired
	private GuestServiceMapper guestServiceMapper;

	@Override
	public Guest getGuestById(int id) {
		// TODO Auto-generated method stub
		return guestMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Guest> getGuestByName(String name, int st, int eachPage) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ST", st);
		map.put("EACH", eachPage);
		map.put("NAME", "%" + name + "%");
		return guestMapper.selectByName(map);
	}

	@Override
	public Guest getGuestByRoomNumber(String s) {
		// TODO Auto-generated method stub
		return guestMapper.selectByRoomNumber(s);
	}

	@Override
	public Guest getGuestByContract(String ct) {
		// TODO Auto-generated method stub
		return guestMapper.selectByContract(ct);
	}

	@Override
	public int addGuest(Guest t) {
		// TODO Auto-generated method stub
		try {
			guestMapper.insert(t);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public int addHost(Host t) {
		// TODO Auto-generated method stub
		try {
			hostMapper.insert(t);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public int addIntern(Intern t) {
		// TODO Auto-generated method stub
		try {
			internMapper.insert(t);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public int addGuestBalance(GuestBalance t) {
		// TODO Auto-generated method stub
		try {
			guestBalanceMapper.insert(t);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public int addGuestService(GuestService t) {
		// TODO Auto-generated method stub
		try {
			guestServiceMapper.insert(t);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}
	
	@Override
	public int delGuest(int id) {
		// TODO Auto-generated method stub
		System.out.println("delete " + id);
		try {
			guestMapper.deleteByPrimaryKey(id);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public int getTotal() {
		// TODO Auto-generated method stub
		return guestMapper.getTotal();
	}
	
	@Override
	public List<Guest> getGuestList(int st, int eachPage) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ST", st);
		map.put("EACH", eachPage);
		return guestMapper.getGuestRange(map);
	}

	@Override
	public int getTotalByName_RoomNumber(String name, String roomNumber) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("NAME", name);
		map.put("ROOM_NUMBER", roomNumber);
		return guestMapper.getTotalByName_RoomNumber(map);
	}

	@Override
	public List<Guest> getGuestByName_RoomNumber(String name, String roomNumber, int st, int eachPage) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("NAME", name);
		map.put("ROOM_NUMBER", roomNumber);
		map.put("ST", st);
		map.put("EACH", eachPage);
		return guestMapper.selectByName_RoomNumber(map);
	}

	@Override
	public List<Guest> getAllGuestByName_RoomNumber(String name, String roomNumber) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("NAME", name);
		map.put("ROOM_NUMBER", roomNumber);
		return guestMapper.selectAllByName_RoomNumber(map);
	}

	/**
	 * 饮用水费
	 */
	
	@Override
	public GuestService getCertainGuestService(Integer gid, String item) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("GUEST_ID", gid);
		map.put("NAME", item);
		
		return guestServiceMapper.selectCertainByGid_Item(map);
	}
}