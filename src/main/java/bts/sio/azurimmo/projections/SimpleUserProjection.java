package bts.sio.azurimmo.projections;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.rest.core.config.Projection;

import bts.sio.azurimmo.model.Utilisateur;

@Projection(name="SimpleUser", types=Utilisateur.class)
public interface SimpleUserProjection {
	public String getPrenom();
	public String getNom();
	public String getEmail();
	
	@Value("#{target.nom +' '+target.prenom}")
	public String getFullName();
}
