package team.smart.dao;

import team.smart.model.Repository;

public interface RepositoryMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(Repository record);

    int insertSelective(Repository record);

    Repository selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(Repository record);

    int updateByPrimaryKey(Repository record);

    Repository selectByRepoNum(String repoNum);
}