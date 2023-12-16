package org.isetn.entities;

import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity

public class Classe {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codClass;
	private String nomClass;
	private int nbreEtud;

	@JsonIgnore
	@OneToMany(mappedBy = "classe")
	private List<Etudiant> etudiants;

	@ManyToMany(cascade = CascadeType.MERGE)
	@JoinTable(name = "classe_matiere", joinColumns = @JoinColumn(name = "classe_id"), inverseJoinColumns = @JoinColumn(name = "matiere_id"))
	private Set<Matiere> matieres = new HashSet<>();

	public Classe() {

	}

	public Classe(Long codClass, String nomClass, int nbreEtud, Collection<Etudiant> etudiants) {
		this.codClass = codClass;
		this.nomClass = nomClass;
		this.nbreEtud = nbreEtud;
		this.etudiants = (List<Etudiant>) etudiants;
	}

	public Long getCodClass() {
		return codClass;
	}

	public void setCodClass(Long codClass) {
		this.codClass = codClass;
	}

	public String getNomClass() {
		return nomClass;
	}

	public void setNomClass(String nomClass) {
		this.nomClass = nomClass;
	}

	public int getNbreEtud() {
		return nbreEtud;
	}

	public void setNbreEtud(int nbreEtud) {
		this.nbreEtud = nbreEtud;
	}

	public List<Etudiant> getEtudiants() {
		return etudiants;
	}

	public void setEtudiants(List<Etudiant> etudiants) {
		this.etudiants = etudiants;
	}

	public Set<Matiere> getMatieres() {
		return matieres;
	}

	public void setMatieres(Set<Matiere> matieres) {
		this.matieres = matieres;
	}

}
