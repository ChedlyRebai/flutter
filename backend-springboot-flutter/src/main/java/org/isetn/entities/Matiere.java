package org.isetn.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity

public class Matiere {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long matiereId;
    private String matiereName;
    private double matiereCoef;
    private double matiereNbh;

    public Matiere() {
    }

    public Matiere(Long matiereId, String matiereName, double matiereCoef, double matiereNbh) {
        this.matiereId = matiereId;
        this.matiereName = matiereName;
        this.matiereCoef = matiereCoef;
        this.matiereNbh = matiereNbh;
    }

    public Long getMatiereId() {
        return matiereId;
    }

    public void setMatiereId(Long matiereId) {
        this.matiereId = matiereId;
    }

    public String getMatiereName() {
        return matiereName;
    }

    public void setMatiereName(String matiereName) {
        this.matiereName = matiereName;
    }

    public double getMatiereCoef() {
        return matiereCoef;
    }

    public void setMatiereCoef(double matiereCoef) {
        this.matiereCoef = matiereCoef;
    }

    public double getMatiereNbh() {
        return matiereNbh;
    }

    public void setMatiereNbh(double matiereNbh) {
        this.matiereNbh = matiereNbh;
    }

    // constructors, getters, and setters
}
