package org.isetn.repository;

import java.time.LocalDateTime;
import java.util.List;

import org.isetn.entities.Absence;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AbsenceRepository extends JpaRepository<Absence, Long> {
    // You can add custom query methods here if needed
    List<Absence> findByEtudiantId(Long codClass);

    List<Absence> findByMatiereMatiereIdAndDateBetween(Long matiereId, LocalDateTime startDate, LocalDateTime endDate);

    List<Absence> findByMatiereIdAndEtudiant_Classe_CodClassAndDate(Long matiereId, Long codClass, LocalDateTime date);
}
