package org.isetn.entities;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity

public class Absence {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long absenceId;

    @ManyToOne
    @JoinColumn(name = "etudiant_id")
    private Etudiant etudiant;

    @ManyToOne
    @JoinColumn(name = "matiere_id")
    private Matiere matiere;

    private double absenceNb;
    private LocalDateTime date;

    public Absence() {
    }

    public Absence(Long absenceId, Etudiant etudiant, Matiere matiere, double absenceNb, LocalDateTime date) {
        this.absenceId = absenceId;
        this.etudiant = etudiant;
        this.matiere = matiere;
        this.absenceNb = absenceNb;
        this.date = date;
    }

    public Long getAbsenceId() {
        return absenceId;
    }

    public void setAbsenceId(Long absenceId) {
        this.absenceId = absenceId;
    }

    public Etudiant getEtudiant() {
        return etudiant;
    }

    public void setEtudiant(Etudiant etudiant) {
        this.etudiant = etudiant;
    }

    public Matiere getMatiere() {
        return matiere;
    }

    public void setMatiere(Matiere matiere) {
        this.matiere = matiere;
    }

    public double getAbsenceNb() {
        return absenceNb;
    }

    public void setAbsenceNb(double absenceNb) {
        this.absenceNb = absenceNb;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    // constructors, getters, and setters
}
