package com.dao;

import java.util.List;

import com.entity.YhRole;

public interface YhRoleMapper {
	int deleteByPrimaryKey(Integer id);

    int insert(YhRole record);

    int insertSelective(YhRole record);

    YhRole selectByPrimaryKey(Integer id);
    int findSingle();
    int updateByPrimaryKeySelective(YhRole record);

    int updateByPrimaryKey(YhRole record);
    List show();
}