package team.smart.dao;

import team.smart.model.ProblemReply;

import java.util.List;

public interface ProblemReplyMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(ProblemReply record);

    int insertSelective(ProblemReply record);

    ProblemReply selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(ProblemReply record);

    int updateByPrimaryKey(ProblemReply record);

     
    ProblemReply selectByProblemID(Integer ProblemID);
    int deleteByProblemID(Integer ID);
    List<ProblemReply> selectAllByProblemID(Integer ProblemID);
}