package DAL;

import BLL.Roli;
import java.util.List;

public interface RoliInterface {
    List<Roli> findAll() throws LibraryException;
}
