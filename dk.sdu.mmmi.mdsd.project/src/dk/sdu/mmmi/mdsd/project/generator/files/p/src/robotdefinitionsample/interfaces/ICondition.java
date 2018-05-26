package robotdefinitionsample.interfaces;

import java.util.Map;
import robotdefinitionsample.models.Property;
import robotdefinitionsample.models.Shelf;

public interface ICondition {
    public boolean checkCondition(int retries, Shelf shelf, Map<String, Property> properties);
}
