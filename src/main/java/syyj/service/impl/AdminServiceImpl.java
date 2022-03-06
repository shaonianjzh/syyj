package syyj.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import syyj.dao.AdminDao;
import syyj.domain.Admin;
import syyj.service.AdminService;

/**
 * @author 少年
 */
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;

    public AdminDao getAdminDao() {
        return adminDao;
    }

    public void setAdminDao(AdminDao adminDao) {
        this.adminDao = adminDao;
    }

    @Override
    public Admin find(String username,String password) {
        return adminDao.find(username,password);
    }
}
