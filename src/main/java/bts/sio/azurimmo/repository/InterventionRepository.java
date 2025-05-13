package bts.sio.azurimmo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import bts.sio.azurimmo.model.Appartement;
import bts.sio.azurimmo.model.Intervention;

@Repository
public interface InterventionRepository extends JpaRepository<Intervention, Long>{

	List<Intervention> findByAppartement_IdAndArchiveFalse(long id);
	List<Intervention> findByArchiveFalse();
}
