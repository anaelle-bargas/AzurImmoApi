package bts.sio.azurimmo.model;
import java.sql.Date;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name="contrat")

public class Contrat {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Column
	private Date date_entree;
	
	@Column
	private Date date_sortie;
	
	@Column
	private float montant_loyer;
	
	@Column
	private float montant_charges;
	
	@ManyToOne
	@JoinColumn(name = "appartement_id")
	private Appartement appartement;
	
	@ManyToOne
	@JoinColumn(name = "associe_id")
	private Associe associe;
	
	@ManyToOne
	@JoinColumn(name="locataire")
	private Locataire locataire;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getDate_entree() {
		return date_entree;
	}

	public void setDate_entree(Date date_entree) {
		this.date_entree = date_entree;
	}

	public Date getDate_sortie() {
		return date_sortie;
	}

	public void setDate_sortie(Date date_sortie) {
		this.date_sortie = date_sortie;
	}

	public float getMontant_loyer() {
		return montant_loyer;
	}

	public void setMontant_loyer(float montant_loyer) {
		this.montant_loyer = montant_loyer;
	}

	public float getMontant_charges() {
		return montant_charges;
	}

	public void setMontant_charges(float montant_charges) {
		this.montant_charges = montant_charges;
	}

	public Associe getAssocie() {
		return associe;
	}

	public void setAssocie(Associe associe) {
		this.associe = associe;
	}

	public Appartement getAppartement() {
		return appartement;
	}

	public void setAppartement(Appartement appartement) {
		this.appartement = appartement;
	}

	public Locataire getLocataire() {
		return locataire;
	}

	public void setLocataire(Locataire locataire) {
		this.locataire = locataire;
	}
	
	
	
}
