package robotdefinitionsample.models;

import javafx.scene.control.Label;
import javafx.scene.layout.GridPane;
import robotdefinitionsample.interfaces.IMoveable;

public class Obstacle extends Label implements IMoveable {
    private Vector2 pos;
    private Vector2 size;

    public Obstacle(String name, Vector2 pos, Vector2 size) {
        super(name);
        this.pos = pos;
        this.size = size;
    }

    public Vector2 getPos() {
        return pos;
    }

    public Vector2 getSize() {
        return size;
    }

    @Override
    public void execute(GridPane grid) { }

    @Override
    public void move(GridPane grid) { }
}
