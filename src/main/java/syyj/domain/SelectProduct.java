package syyj.domain;

public class SelectProduct {
    private String type;
    private String material;
    private String space;

    @Override
    public String toString() {
        return "SelectProduct{" +
                "type='" + type + '\'' +
                ", material='" + material + '\'' +
                ", space='" + space + '\'' +
                '}';
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getSpace() {
        return space;
    }

    public void setSpace(String space) {
        this.space = space;
    }
}
