package org.isetn.repository;

import java.time.LocalDateTime;
import java.util.List;

import org.isetn.entities.Absence;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AbsenceRepository extends JpaRepository<Absence, Long> {
    // You can add custom query methods here if needed
    List<Absence> findByEtudiantId(Long codClass);

    List<Absence> findByMatiereMatiereIdAndDateBetween(Long matiereId, LocalDateTime startDate, LocalDateTime endDate);

    @Query("SELECT a FROM Absence a WHERE a.matiere.matiereId = :matiereId AND a.etudiant.classe.codClass = :codClass AND a.date = :date")
    List<Absence> findByMatiereIdAndEtudiant_Classe_CodClassAndDate(
            @Param("matiereId") Long matiereId,
            @Param("codClass") Long codClass,
            @Param("date") LocalDateTime date);
}
