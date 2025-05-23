package bts.sio.azurimmo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import bts.sio.azurimmo.model.Contrat;
import bts.sio.azurimmo.model.Locataire;
import bts.sio.azurimmo.repository.LocataireRepository;
import bts.sio.azurimmo.service.LocataireService;

@RestController
@RequestMapping("/api/locataires")

public class LocataireController {
	@Autowired
	private LocataireService locataireService;
	
	@GetMapping("/")
	public List<Locataire> findAll(){
		return locataireService.findAll();
	}
	
	@GetMapping("/avec_archives/")
	public List<Locataire> getLesLocatairesAvecArchives(){
		return locataireService.getLesLocatairesAvecArchives();
	}
	
	@PostMapping("/")
	public Locataire createLocataire(@RequestBody Locataire locataire) {
		return locataireService.createLocataire(locataire);
	}
	
	@DeleteMapping("/{id}")
	public void deleteLocataire(@PathVariable Long id) {
		locataireService.deleteLocataire(id);
	}
	
	@PutMapping("/archiver/{id}")
	public ResponseEntity<Void> archiverLocataire(@PathVariable Long id) {
		locataireService.archiverLocataire(id);
	    return ResponseEntity.noContent().build();
	}
}
