package team.smart.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import team.smart.app.Config;
import team.smart.model.User;
import team.smart.service.RoomService;
import team.smart.service.UserService;
import team.smart.utils.MD5Builder;
import team.smart.utils.Para;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping("/HomeUser")
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private RoomService roomService;

	private static Logger logger = Logger.getLogger("logRec");

	@RequestMapping("/requestRole")
	public @ResponseBody Map<Integer, String> departRole() {

		Map<String, List<String>> temp = Para.getParaList("role");
		Map<Integer, String> ans = new HashMap<Integer, String>();
		Iterator<Entry<String, List<String>>> it = temp.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<String, List<String>> entry = it.next();
			ans.put(Integer.parseInt(entry.getKey()), entry.getValue().get(0));
		}
		return ans;
	}

	@RequestMapping("/changePassword")
	public @ResponseBody Integer changePassword(HttpSession session, @RequestBody String stringPassword) {
		JSONObject passwordJson = (JSONObject) JSONObject.parse(stringPassword);
		String password = passwordJson.getString("password");
		User curUser = (User) session.getAttribute("curUser");
		curUser.setPASSWD(MD5Builder.create(password));
		curUser.setRESET_PASSWD((byte)1);

		if (userService.updateUserInfo(curUser) == 1) {
			logger.info("Change password of " + curUser.getNAME());
			return 1;
		} else {
			logger.error("Failed to change password of " + curUser.getNAME());
			return 0;
		}
	}

	@RequestMapping("/Model/")
	public Map<String, Object> Model(HttpSession session, @RequestBody Integer rid) {
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		return ans;
	}

	//查询目前多有用户
	@RequestMapping("/searchAllUsers")
	@ResponseBody
	public Map<String, Object> searchAllUsers(HttpSession session) {

		@SuppressWarnings("unused")
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
//			ans.put("State", "Invalid");
//			return ans;
//		} else {
//			ans.put("State", "Valid");
//		}

		List<User> recordList = userService.getAllUsers();
		ans.put("State", "Valid");
		ans.put("record", recordList);
		return ans;


	}
}
