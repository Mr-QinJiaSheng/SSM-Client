package com.dao;

import java.util.List;

import com.entity.YhRoot;

public interface YhRootMapper {
	int deleteByPrimaryKey(Integer id);

    int insert(YhRoot record);

    int insertSelective(YhRoot record);

    YhRoot selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(YhRoot record);

    int updateByPrimaryKey(YhRoot record);
    List show();
}