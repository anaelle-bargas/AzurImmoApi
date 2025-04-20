package bts.sio.azurimmo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import bts.sio.azurimmo.model.Appartement;
import bts.sio.azurimmo.model.Intervenant;
import bts.sio.azurimmo.service.IntervenantService;

@RestController
@RequestMapping("/api/intervenants")
public class IntervenantController {
	@Autowired
	private IntervenantService intervenantService;
	
	
	@GetMapping("/")
	public List<Intervenant> getLesInterventions(){
		return intervenantService.getLesIntervenants();
	}
	
	@PostMapping("/")
	public Intervenant addIntervention(@RequestBody Intervenant intervenant){
		return intervenantService.createIntervenant(intervenant);
	}
}

