package robotdefinitionsample;

import javafx.scene.Node;
import javafx.scene.layout.GridPane;
import robotdefinitionsample.models.Obstacle;
import robotdefinitionsample.models.Shelf;
import robotdefinitionsample.models.Vector2;

public class ObstacleDetection {
    public static boolean detect(GridPane grid, DesiredProps props) {
        int x = props.getPos().getX();
        int y = props.getPos().getY();
        
        for(Node node : grid.getChildren()) {
            if (node instanceof Obstacle) {
                Vector2 pos = ((Obstacle) node).getPos();
                if (pos.getX() == x && pos.getY() == y) {
                    return true;
                }
            }
        }
        return false;
    }
    
    public static Shelf getShelfAtPos(GridPane grid, DesiredProps props) {
        int x = props.getPos().getX();
        int y = props.getPos().getY();
        for(Node node : grid.getChildren()) {
            if (node instanceof Shelf) {
                Vector2 pos = ((Shelf) node).getPos();
                if (pos.getX() == x && pos.getY() == y) {
                    return (Shelf) node;
                }
            }
        }
        return null;
    }
}
