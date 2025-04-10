package bts.sio.azurimmo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import bts.sio.azurimmo.model.Utilisateur;


@Repository
public interface UtilisateurRepository extends JpaRepository<Utilisateur, Long>{
	public Utilisateur findByEmail(String email);
}
