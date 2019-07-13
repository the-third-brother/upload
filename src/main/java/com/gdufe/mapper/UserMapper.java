package com.gdufe.mapper;

import com.gdufe.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.Date;

public interface UserMapper {
    User login(@Param("user") String user, @Param("password") String password);

    int updateLoginTime(@Param("uId") int uId, @Param("loginTime") String loginTime);
}
