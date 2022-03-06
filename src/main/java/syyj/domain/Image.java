package syyj.domain;

public class Image {
    private String src;
    private String title;

    @Override
    public String toString() {
        return "Image{" +
                "src='" + src + '\'' +
                ", title='" + title + '\'' +
                '}';
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
