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

import bts.sio.azurimmo.model.Appartement;
import bts.sio.azurimmo.model.Intervention;
import bts.sio.azurimmo.model.Locataire;
import bts.sio.azurimmo.service.InterventionService;

@RestController
@RequestMapping("/api/interventions")
public class InterventionController {
	@Autowired
	private InterventionService interventionService;
	
	
	@GetMapping("/")
	public List<Intervention> getLesInterventions(){
		return interventionService.getLesInterventions();
	}
	
	@GetMapping("/avec_archives/")
	public List<Intervention> getLesInterventionsAvecArchives(){
		return interventionService.getLesInterventionsAvecArchives();
	}
	
	@PostMapping("/")
	public Intervention createIntervention(@RequestBody Intervention intervention) {
		return interventionService.createIntervention(intervention);
	}
	
	@DeleteMapping("/{id}")
	public void deleteIntervention(@PathVariable Long id) {
		interventionService.deleteIntervention(id);
	}
	
	@GetMapping("/appartement/{appartementId}")
	public List<Intervention> getInterventionsParAppartement(@PathVariable long appartementId) {
		return interventionService.getInterventionsParAppartement(appartementId);
	}
	
	@PutMapping("/archiver/{id}")
	public ResponseEntity<Void> archiverIntervention(@PathVariable Long id) {
		interventionService.archiverIntervention(id);
	    return ResponseEntity.noContent().build();
	}
}

