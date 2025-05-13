package bts.sio.azurimmo.controller;
import bts.sio.azurimmo.model.Appartement;
import bts.sio.azurimmo.model.Batiment;
import bts.sio.azurimmo.repository.BatimentRepository;
import bts.sio.azurimmo.service.AppartementService;
import bts.sio.azurimmo.service.BatimentService;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/api/batiments")
@CrossOrigin(origins= {"http://127.0.0.1:3000", "http://localhost:3000"})

public class BatimentController {
	@Autowired
	private BatimentService batimentService;
	
	@Autowired
	private BatimentRepository batimentRepository;
	
	@PostMapping("/")
	public Batiment createBatiment(@RequestBody Batiment batiment) {
		return batimentService.saveBatiment(batiment);
	}
	
	@GetMapping("/")
	public List<Batiment> getBatiments() {
		return batimentService.getBatiments();
	}
	
	@GetMapping("/avec_archives/")
	public List<Batiment> getBatimentsAvecArchives() {
		return batimentService.getBatimentsAvecArchives();
	}
	
	@GetMapping("/id/{id}")
	public Optional<Batiment> getBatimentById(@PathVariable Long id) {
		return batimentService.getBatimentById(id);
	}
	
	
	@DeleteMapping("/{id}")
	public void deleteBatiment(@PathVariable Long id) {
		batimentService.deleteBatiment(id);
	}
	
	@PutMapping("/")
    public Batiment updateBatiment(@RequestBody Batiment batimentModifie) {
        return batimentService.updateBatiment(batimentModifie);
    }
	
	@PutMapping("/archiver/{id}")
	public ResponseEntity<Void> archiverBatiment(@PathVariable Long id) {
	    batimentService.archiverBatiment(id);
	    return ResponseEntity.noContent().build();
	}

	
	
	//@GetMapping("/surfaceTotale/{idBatiment}")
	//public double getSurfaceBatiment(@PathVariable long idBatiment){
	//	return batimentService.getSurfaceBatiment(idBatiment);
	//}
	
	//@GetMapping("/ville/{idVille}")
	//public List<Batiment> findByVille(@PathVariable long idVille){
	//	return batimentService.findByVille(idVille);
	//}
}
