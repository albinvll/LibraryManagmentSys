package DAL;

import BLL.Rezervimet;
import java.util.ArrayList;
import java.util.List;

public class RezervimetRepository extends EntMngClass implements RezervimetInterface{
    @Override
    public void create(Rezervimet r) throws LibraryException {
         try{
             em.getTransaction().begin();
             em.persist(r);
             em.getTransaction().commit();
         }catch(Exception e){
             throw new LibraryException("Msg \n"+e.getMessage());
         }
    }

    @Override
    public void edit(Rezervimet r) throws LibraryException {
        try{
            em.getTransaction().begin();
            em.merge(r);
            em.getTransaction().commit();
        }catch(Exception e){
            throw new LibraryException("Msg \n"+e.getMessage());
        }
    }

    /**
     *
     * @param r
     * @throws LibraryException
     */
    @Override
    public void delete(Rezervimet r) throws LibraryException {
        try{
            em.getTransaction().begin();
            em.remove(r);
            em.getTransaction().commit();
        }catch(Exception e){
            throw new LibraryException("Msg \n"+e.getMessage());
        }
    }

    @Override
    public List<Rezervimet> findAll() throws LibraryException {
        try{
            return em.createNamedQuery("Rezervimet.findAll").getResultList();
        }catch(Exception e){
            throw new LibraryException("Msg \n"+e.getMessage());
        }
    }

    public List<Rezervimet> findByAktiv()throws LibraryException{
        try{
            List<Rezervimet> rezervimi = em.createNamedQuery("Rezervimet.findAll").getResultList();
            List<Rezervimet> res = new ArrayList<Rezervimet>();
            
            for(Rezervimet r: rezervimi){
                if(r.getAktiv()==true){
                    res.add(r);
                }
            }
            return res;
            
            
        }catch(Exception e){
            
        }
        return null;
    }
}
