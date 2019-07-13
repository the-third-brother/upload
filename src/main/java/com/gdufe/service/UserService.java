package com.gdufe.service;

import com.gdufe.entity.User;

public interface UserService {
    User login(String user, String password);

    int updateLoginTime(int uId, String loginTime);
}
