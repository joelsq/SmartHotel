package team.smart.service;

//import java.util.Date;
import java.util.List;

import team.smart.model.*;

public interface ServerService {

	int getTotalDailyServiceRow(String rn, int type);

	int getTotalSourcesRow(String rn, String type);

	int getExactTotalSourcesRow(String rn, String type);//房间号精确查询

	List<DailyService> searchBill(String rn, int type, int st, int eachPage);

	List<Sources> searchSource(String rn, String type, int st, int eachPage);

	List<Sources> searchExactSource(String rn, String type, int st, int eachPage);//房间号精切查询

	int addDailyService(DailyService service);

	int addSources(Sources source);

	Sources getSource(String num, String type);

	Sources getGasSource(String num, String type ,String meter);

	List<Sources> getPairSource(String num);
	List<Sources> getLookupSource(String rn, String type,String guest);
	List<Sources> getHistoryLookupSource(String rn, String type);
	
	List<Staff> searchStaff(String DUTY);

	int addTakeaway(Meal meal);
	
	int getTotalMealRow(String rn , String date);  
	
	List<Meal> searchMeal(String rn, String date ,int st, int eachPage); 
	
	int deleteMeal(Integer id);
	
	int updateMeal(Meal l);
	
	Meal getMealById(Integer id);
	
	int addShoeCleaning(ShoesPolishing shoe);
	
	int getTotalShoeCleaningRow(String rn , String date); 
	
	List<ShoesPolishing> searchShoeCleaning(String rn, String date , int st, int eachPage); 
	
	int deleteShoesPolishing(Integer id);
	
	ShoesPolishing getShoesPolishingById(Integer id);
	
	int updateShoesPolishing(ShoesPolishing shoe);
	
	int addAgentPurchase(AgentPurchase agent);
	
	int getTotalAgentPurchaseRow(String rn , String date); 
	
	List<AgentPurchase> searchAgentPurchase(String rn,String date, int st, int eachPage); 
	
	int deleteAgentPurchase(Integer id);
	
	AgentPurchase getAgentPurchaseById(Integer id);
	
	int updateAgentPurchase(AgentPurchase agent);
	
	List<AgentPurchase> getAllAgentPurchase(String rn , String date); 
	
	List<ShoesPolishing> getAllShoesPolishing(String rn , String date); 
	
	List<Meal> getAllMeal(String rn , String date);

	int addExpenseOfLE(CostLe cost);
}
