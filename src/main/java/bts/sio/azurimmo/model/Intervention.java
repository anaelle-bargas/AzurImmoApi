package bts.sio.azurimmo.model;
import java.sql.Date;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name="intervention")

public class Intervention {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="description")
	private String description;
	
	@Column(name="date")
	private Date date;
	
	@Column(name="archive")
	private Boolean archive;
	
	@ManyToOne
	@JoinColumn(name = "appartement_id")
	private Appartement appartement;
	
	@ManyToOne
	@JoinColumn(name = "intervenant_id")
	private Intervenant intervenant;
	
	
	@ManyToOne
	@JoinColumn(name = "type_intervention_id")
	private TypeIntervention typeIntervention;


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public Date getDate() {
		return date;
	}


	public void setDate(Date date) {
		this.date = date;
	}


	public Appartement getAppartement() {
		return appartement;
	}


	public void setAppartement(Appartement appartement) {
		this.appartement = appartement;
	}


	public Intervenant getIntervenant() {
		return intervenant;
	}


	public void setIntervenant(Intervenant intervenant) {
		this.intervenant = intervenant;
	}


	public TypeIntervention getTypeIntervention() {
		return typeIntervention;
	}


	public void setTypeIntervention(TypeIntervention typeIntervention) {
		this.typeIntervention = typeIntervention;
	}


	public Boolean getArchive() {
		return archive;
	}


	public void setArchive(Boolean archive) {
		this.archive = archive;
	}
	
	
	
	
	

}
