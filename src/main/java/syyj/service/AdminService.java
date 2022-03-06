package syyj.service;

import syyj.domain.Admin;

public interface AdminService {
    public Admin find(String username, String password);
}
