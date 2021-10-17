package com.dao;

import java.util.*;

import com.entity.YhEmployee;

public interface YhEmployeeMapper {
	int deleteByPrimaryKey(Integer id);

    int insert(YhEmployee record);

    int insertSelective(YhEmployee record);
    YhEmployee tel(String id);
    YhEmployee selectByPrimaryKey(Integer id);
    YhEmployee select(Integer id);

    int updateByPrimaryKeySelective(YhEmployee record);
    List find(Map map);
    List rights(String empname);
    int updateByPrimaryKey(YhEmployee record);
    YhEmployee login(YhEmployee record);
    List show(Map map);
    int getTotal(Map map);
    YhEmployee reg(String record);
    List like(Map map);
    int getlikeTotal(Map map);
}