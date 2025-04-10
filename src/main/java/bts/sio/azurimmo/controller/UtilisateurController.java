package bts.sio.azurimmo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import bts.sio.azurimmo.model.Utilisateur;
import bts.sio.azurimmo.projections.SimpleUserProjection;
import bts.sio.azurimmo.repository.UtilisateurRepository;

@RestController
@RequestMapping("/api/utilisateur")
public class UtilisateurController {
	
	@Autowired
	private UtilisateurRepository utilisateurRepo;
	
	@GetMapping("/")
	public List<SimpleUserProjection> getUtilisateurs(){
		return utilisateurRepo.findAllUsers(SimpleUserProjection.class);
	}
}
