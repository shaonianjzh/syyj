package syyj.service;

import syyj.domain.*;

import java.util.List;

public interface CompanyService {

    List<Culture> findAll();

    void delCulture(Long id);

    void addCulture(Culture culture);

    List<Achievement> findAllAchievement();

    void delAchievement(Long id);

    List<Honor> findAllHonor();

    void Honor(Long id);

    void editCulture(Culture culture);

    Culture finCulture(Integer id);

    void addAchievement(Achievement achievement);

    Achievement findAchievement(Integer id);

    void editAchievement(Achievement achievement);

    void uploadCompanyImage(String filename);

    void uploadHonorImage(String filename);

    void updateHonorImage(String filename, Integer id);

    void addIntroduce(String str);

    void addAdvantage(String file);

    void joinCondition(String file);

    void joinProgress(String file);

    CompanyIntroduce findImage();

    Join findJoin();
}
