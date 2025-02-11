package bts.sio.azurimmo.model;
import java.sql.Date;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name="paiement")

public class Paiement {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Column
	private float montant;
	
	@Column
	private Date date_paiement;
}
