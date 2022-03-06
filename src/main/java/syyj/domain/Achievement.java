package syyj.domain;

public class Achievement {

    private int id;
    private int yearth;
    private String achievement;

    @Override
    public String toString() {
        return "Achievement{" +
                "id=" + id +
                ", yearth=" + yearth +
                ", achievement='" + achievement + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getYearth() {
        return yearth;
    }

    public void setYearth(int yearth) {
        this.yearth = yearth;
    }

    public String getAchievement() {
        return achievement;
    }

    public void setAchievement(String achievement) {
        this.achievement = achievement;
    }
}
