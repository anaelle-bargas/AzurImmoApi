package bts.sio.azurimmo.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import bts.sio.azurimmo.model.Associe;
import bts.sio.azurimmo.service.AssocieService;

@RestController
@RequestMapping("api/associes")
public class AssocieController {
	@Autowired
	private AssocieService associeService;
	
	@GetMapping("/")
	public List<Associe> getLesAssocies(){
		return associeService.getLesAssocies();
	}
	
	@GetMapping("/{id}")
	public Optional<Associe> getAssocie(@PathVariable Long id) {
		return associeService.getAssocie(id);
	}
	
	@PutMapping("/")
	public Associe modifyAssocie(@RequestBody Associe associeModifie) {
		return associeService.modifyAssocie(associeModifie);
	}
}
