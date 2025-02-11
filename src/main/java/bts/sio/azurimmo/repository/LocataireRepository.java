package bts.sio.azurimmo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import bts.sio.azurimmo.model.Batiment;
import bts.sio.azurimmo.model.Locataire;
import bts.sio.azurimmo.service.LocataireService;

@Repository
public interface LocataireRepository extends JpaRepository<Locataire, Long>{
	
	
}
