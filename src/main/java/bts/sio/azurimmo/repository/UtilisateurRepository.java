package bts.sio.azurimmo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import bts.sio.azurimmo.model.Utilisateur;
import bts.sio.azurimmo.projections.SimpleUserProjection;


@Repository
public interface UtilisateurRepository extends JpaRepository<Utilisateur, Long>{
	public Utilisateur findByEmail(String email);
	
	@Query("select u from Utilisateur u")
	public <T> List<T> findAllUsers(Class<T> clazz);
}
