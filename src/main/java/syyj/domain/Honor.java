package syyj.domain;

public class Honor {
    private int id;
    private String image;

    @Override
    public String toString() {
        return "Honor{" +
                "id=" + id +
                ", image='" + image + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
