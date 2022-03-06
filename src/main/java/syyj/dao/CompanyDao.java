package syyj.dao;

import syyj.domain.*;

import java.util.List;

public interface CompanyDao {

    List<Culture> findAll();

    void delById(Long id);

    void insertCulture(Culture culture);

    List<Achievement> findAllAchievement();

    void delAchievement(Long id);

    List<Honor> findAllHonor();

    void delHonor(Long id);

    void editCulture(Culture culture);

    Culture findCulture(Integer id);

    void insertAchievement(Achievement achievement);

    Achievement findAchievement(Integer id);

    void editAchievement(Achievement achievement);

    void uploadCompanyImage(String filename);

    void uploadHonorImage(String filename);

    void updateHonorImage(String filename, Integer id);

    void addIntroduce(String str);

    void addAdvantage(String file);

    void addCondition(String file);

    void addProgress(String file);

    CompanyIntroduce findImage();

    Join findJoin();
}
