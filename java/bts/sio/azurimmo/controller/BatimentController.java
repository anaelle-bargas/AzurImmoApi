package bts.sio.azurimmo.controller;
import bts.sio.azurimmo.model.Appartement;
import bts.sio.azurimmo.model.Batiment;
import bts.sio.azurimmo.service.AppartementService;
import bts.sio.azurimmo.service.BatimentService;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/api/batiments")


public class BatimentController {
	@Autowired
	private BatimentService batimentService;
	
	@PostMapping("/")
	public Batiment createBatiment(@RequestBody Batiment batiment) {
		return batimentService.saveBatiment(batiment);
	}
	
	@GetMapping("/")
	public List<Batiment> getBatiments() {
		return batimentService.getBatiments();
	}
	
	@GetMapping("/id/{id}")
	public Optional<Batiment> getBatimentById(@PathVariable Long id) {
		return batimentService.getBatimentById(id);
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
