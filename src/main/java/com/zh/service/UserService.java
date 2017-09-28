package com.zh.service;

import com.zh.entity.UserDo;

import java.util.List;

/**
 * Created by lk on 2017-09-27.
 * 用户servirce层的操作
 */
public interface UserService {
    public int insert(UserDo u);
    public UserDo selectOne(UserDo u);
    public List<UserDo> queryAll();



}
