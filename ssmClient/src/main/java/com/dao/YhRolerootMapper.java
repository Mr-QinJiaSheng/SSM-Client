package com.dao;

import com.entity.YhRoleroot;

public interface YhRolerootMapper {
    int insert(YhRoleroot record);

	int insertSelective(YhRoleroot record);
	int del(Integer id);
}