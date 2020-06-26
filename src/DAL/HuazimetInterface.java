package DAL;

import BLL.Huazimet;
import java.util.List;


public interface HuazimetInterface {
    void create(Huazimet a) throws LibraryException;
    void edit(Huazimet a) throws LibraryException;
    void delete(Huazimet a)throws LibraryException;
    List<Huazimet> findAll() throws LibraryException;
}
