package bts.sio.azurimmo.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import bts.sio.azurimmo.model.Contrat;
import bts.sio.azurimmo.model.Intervention;
import bts.sio.azurimmo.service.ContratService;

@RestController
@RequestMapping("/api/contrats")
public class ContratController {
	@Autowired
	private ContratService contratService;
	
	
	@GetMapping("/")
	public List<Contrat> getLesContrats(){
		return contratService.getLesContrats();
	}
	
	@GetMapping("/avec_archives/")
	public List<Contrat> getLesContratsAvecArchives(){
		return contratService.getLesContratsAvecArchives();
	}
	
	
	@PostMapping("/")
	public Contrat createContrat(@RequestBody Contrat contrat) {
		return contratService.saveContrat(contrat);
	}
	
	
	@GetMapping("/id/{id}")
	public Optional<Contrat> getContratById(@PathVariable Long id) {
		return contratService.getContratById(id);
	}
	
	@GetMapping("/appartement/{appartementId}")
	public List<Contrat> getContratsParAppartement(@PathVariable long appartementId) {
		return contratService.getContratsParAppartement(appartementId);
	}
	
	
	@DeleteMapping("/{id}")
	public void deleteContrat(@PathVariable Long id) {
		contratService.deleteContrat(id);
	}
	
	
	@PutMapping("/")
    public Contrat updateContrat(@RequestBody Contrat contratModifie) {
        return contratService.updateContrat(contratModifie);
    }
}
