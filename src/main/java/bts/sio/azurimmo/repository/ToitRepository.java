package bts.sio.azurimmo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import bts.sio.azurimmo.model.Toit;

@Repository
public interface ToitRepository extends JpaRepository<Toit, Long>{
	List<Toit> findByLibelle(String libelle);
}
