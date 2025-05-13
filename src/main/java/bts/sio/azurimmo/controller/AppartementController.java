package bts.sio.azurimmo.controller;
import bts.sio.azurimmo.model.Appartement;
import bts.sio.azurimmo.model.Batiment;
import bts.sio.azurimmo.service.AppartementService;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/appartements")

public class AppartementController {

	@Autowired
	private AppartementService appartementService;
	
	@PostMapping("/")
	public Appartement createAppartement(@RequestBody Appartement appartement) {
		return appartementService.saveAppartement(appartement);
	}
	
	@GetMapping("/id/{id}")
	public Optional<Appartement> getAppartementById(@PathVariable Long id) {
		return appartementService.getAppartementById(id);
	}
	@GetMapping("/")
	public List<Appartement> getAppartements() {
		return appartementService.getAppartements();
	}
	
	@GetMapping("/avec_archives/")
	public List<Appartement> getBatimentsAvecArchives() {
		return appartementService.getAppartementsAvecArchives();
	}
	
	@GetMapping("/ville/{ville}")
	public List<Appartement> findByVille(@PathVariable String ville) {
		return appartementService.findByVille(ville);
	}
	
	@GetMapping("/batiment/{batimentId}")
	public List<Appartement> getAppartementsParBatiment(@PathVariable long batimentId) {
		return appartementService.getAppartementsParBatiment(batimentId);
	}
	
	@GetMapping("/surface/plusGrandeQue/{surface}")
	public List<Appartement> getAppartementsParSurfacePlusGrandesQue(@PathVariable double surface){
		return appartementService.getAppartementsParSurfacePlusGrandeQue(surface);
	}
	
	@GetMapping("/surface/{surface}")
	public List<Appartement> findBySurface(@PathVariable double surface){
		return appartementService.findBySurface(surface);
	}
	
	@DeleteMapping("/{id}")
	public void deleteAppartement(@PathVariable Long id) {
		appartementService.deleteAppartement(id);
	}
	
	@PutMapping("/")
    public Appartement updateBatiment(@RequestBody Appartement appartementModifie) {
        return appartementService.updateAppartement(appartementModifie);
    }
	
	@PutMapping("/archiver/{id}")
	public ResponseEntity<Void> archiverAppartement(@PathVariable Long id) {
		appartementService.archiverAppartement(id);
	    return ResponseEntity.noContent().build();
	}
}
