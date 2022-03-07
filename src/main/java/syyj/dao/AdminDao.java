package syyj.dao;

import org.apache.ibatis.annotations.Param;
import syyj.domain.Admin;

public interface AdminDao {

    Admin find(@Param("username") String username, @Param("password") String password);
}
