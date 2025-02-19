package bts.sio.azurimmo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bts.sio.azurimmo.model.Toit;
import bts.sio.azurimmo.repository.ToitRepository;
import lombok.Data;

@Data
@Service
public class ToitService {

	@Autowired
	private ToitRepository toitRepository;
	
	public Toit createToit(Toit toit) {
		Toit savedToit = toitRepository.save(toit);
		return savedToit;
	}
	
	public List<Toit> getLesToits(){
		return toitRepository.findAll();
	}
	
	public List<Toit> getToitsByLibelle(String libelle){
		return toitRepository.findByLibelle(libelle);
	}
	
	
}
