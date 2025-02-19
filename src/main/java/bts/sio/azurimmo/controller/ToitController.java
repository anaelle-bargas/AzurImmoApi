package bts.sio.azurimmo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import bts.sio.azurimmo.model.Toit;
import bts.sio.azurimmo.service.ToitService;

@RestController
@RequestMapping("/api/toits")

public class ToitController {
	
	@Autowired
	private ToitService toitService;
	
	
	@PostMapping("/")
	public Toit createToit(@RequestBody Toit toit) {
		return toitService.createToit(toit);
	}
	
	@GetMapping("/")
	public List<Toit> getLesToits(){
		return toitService.getLesToits();
	}
	
	
	@GetMapping("/libelle/{libelle}")
	public List<Toit> getToitsByLibelle(@PathVariable String libelle){
		return toitService.getToitsByLibelle(libelle);
	}
	
	
	

}
