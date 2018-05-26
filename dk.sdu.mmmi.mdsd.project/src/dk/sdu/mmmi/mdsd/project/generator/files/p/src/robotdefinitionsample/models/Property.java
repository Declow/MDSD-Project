package robotdefinitionsample.models;

public class Property {
    private String name;
    private int _default;

    public String getName() {
        return name;
    }

    public int getDefault() {
        return _default;
    }

    public Property(String name, int _default) {
        this.name = name;
        this._default = _default;
    }
}
