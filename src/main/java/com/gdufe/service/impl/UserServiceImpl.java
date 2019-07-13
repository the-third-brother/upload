package com.gdufe.service.impl;

import com.gdufe.entity.User;
import com.gdufe.mapper.UserMapper;
import com.gdufe.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User login(String user, String password) {
        return userMapper.login(user, password);
    }

    @Override
    public int updateLoginTime(int uId, String loginTime) {
        userMapper.updateLoginTime(uId, loginTime);
        return 0;
    }
}
