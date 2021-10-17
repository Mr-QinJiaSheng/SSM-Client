package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.KhClientinfo;

public interface KhClientinfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(KhClientinfo record);

    int insertSelective(KhClientinfo record);

    KhClientinfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(KhClientinfo record);

    int updateByPrimaryKey(KhClientinfo record);
    List show(Map map);
    int getTotal();
    int getlikeTotal(Map map);
    List like(Map map);
    KhClientinfo isdn();
    KhClientinfo tel(String tel);
}