package com.zh.service.impl;

import com.zh.entity.UserDo;
import com.zh.mapper.UserDoMapper;
import com.zh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by lk on 2017-09-27.
 * 用户得注册登录
 */
@Component
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDoMapper user;
    /**
     * @param u
     * 注册页面传过来的参数用实体对象接收
     * @return
     */
    public int insert(UserDo u){
        return user.insert(u);
    }
    /**
     * @param u
     * @return
     */
    public UserDo selectOne(UserDo u) {
        return user.selectOne(u);
    }

    public List<UserDo> queryAll() {
        return user.selectAll();
    }
}
