package bts.sio.azurimmo.repository;
import org.springframework.stereotype.Repository;
import bts.sio.azurimmo.model.Appartement;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;


@Repository
public interface AppartementRepository extends JpaRepository<Appartement, Long>{
	List<Appartement> findByBatiment_Ville(String ville);
	List<Appartement> findByBatiment_Id(long id);
	List<Appartement> findBySurfaceGreaterThan(double surface);
	List<Appartement> findBySurface(double surface);

}
