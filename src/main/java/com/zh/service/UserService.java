package com.zh.service;

import com.zh.entity.UserDo;
import com.zh.mapper.UserDoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Created by webrx on 2017-09-20.
 */
@Component
public class UserService implements UserDoMapper {
    @Autowired
    private UserDoMapper u;
    public int deleteByPrimaryKey(Integer uId) {
        return u.deleteByPrimaryKey(uId);
    }

    public int insert(UserDo record) {
        return u.insert(record);
    }

    public int insertSelective(UserDo record) {
        return u.insertSelective(record);
    }

    public UserDo selectByPrimaryKey(Integer uId) {
        return u.selectByPrimaryKey(uId);
    }

    public int updateByPrimaryKeySelective(UserDo record) {
        return u.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(UserDo record) {
        return u.updateByPrimaryKey(record);
    }
}
