package bts.sio.azurimmo.model;
import jakarta.persistence.*;
import lombok.Data;


@Data
@Entity
@Table(name="type_intervention")

public class TypeIntervention {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="libelle")
	private String libelle;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getLibelle() {
		return libelle;
	}

	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}
	
	
}
