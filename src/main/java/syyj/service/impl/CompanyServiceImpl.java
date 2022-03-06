package syyj.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import syyj.dao.CompanyDao;
import syyj.domain.*;
import syyj.service.CompanyService;

import java.util.List;

@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    private CompanyDao companyDao;
    @Override
    public List<Culture> findAll() {
        return companyDao.findAll();
    }

    @Override
    public void delCulture(Long id) {
        companyDao.delById(id);
    }

    @Override
    public void addCulture(Culture culture) {
        companyDao.insertCulture(culture);
    }

    @Override
    public List<Achievement> findAllAchievement() {
        return companyDao.findAllAchievement();
    }

    @Override
    public void delAchievement(Long id) {
        companyDao.delAchievement(id);
    }

    @Override
    public List<Honor> findAllHonor() {
        return companyDao.findAllHonor();
    }

    @Override
    public void Honor(Long id) {
        companyDao.delHonor(id);
    }

    @Override
    public void editCulture(Culture culture) {
        companyDao.editCulture(culture);
    }

    @Override
    public Culture finCulture(Integer id) {
        return companyDao.findCulture(id);
    }

    @Override
    public void addAchievement(Achievement achievement) {
        companyDao.insertAchievement(achievement);
    }

    @Override
    public Achievement findAchievement(Integer id) {
        return companyDao.findAchievement(id);
    }

    @Override
    public void editAchievement(Achievement achievement) {
        companyDao.editAchievement(achievement);
    }

    @Override
    public void uploadCompanyImage(String filename) {
        companyDao.uploadCompanyImage(filename);
    }

    @Override
    public void uploadHonorImage(String filename) {
        companyDao.uploadHonorImage(filename);
    }

    @Override
    public void updateHonorImage(String filename, Integer id) {
        companyDao.updateHonorImage(filename,id);
    }

    @Override
    public void addIntroduce(String str) {
        companyDao.addIntroduce(str);
    }

    @Override
    public void addAdvantage(String file) {
        companyDao.addAdvantage(file);
    }

    @Override
    public void joinCondition(String file) {
        companyDao.addCondition(file);
    }

    @Override
    public void joinProgress(String file) {
        companyDao.addProgress(file);
    }

    @Override
    public CompanyIntroduce findImage() {
        return companyDao.findImage();
    }

    @Override
    public Join findJoin() {
        return companyDao.findJoin();
    }
}
