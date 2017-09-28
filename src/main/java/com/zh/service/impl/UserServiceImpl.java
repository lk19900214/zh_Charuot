package com.zh.service.impl;

import com.zh.entity.UserDo;
import com.zh.mapper.UserDoMapper;
import com.zh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Created by webrx on 2017-09-27.
 */
@Component
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDoMapper user;
    public int insert(UserDo u){
        return user.insert(u);
    }

}
