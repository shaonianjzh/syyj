package syyj.dao;

import syyj.domain.Admin;

public interface AdminDao {

    Admin find(String username,String password);
}
