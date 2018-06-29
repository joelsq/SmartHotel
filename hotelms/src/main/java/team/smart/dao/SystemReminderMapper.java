package team.smart.dao;

import team.smart.model.SystemReminder;

public interface SystemReminderMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(SystemReminder record);

    int insertSelective(SystemReminder record);

    SystemReminder selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(SystemReminder record);

    int updateByPrimaryKey(SystemReminder record);
}