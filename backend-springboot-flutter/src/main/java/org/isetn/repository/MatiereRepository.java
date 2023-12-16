package org.isetn.repository;

import java.util.Optional;

import org.isetn.entities.Matiere;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MatiereRepository extends JpaRepository<Matiere, Long> {
    // You can add custom query methods here if needed
    Optional<Matiere> findByMatiereName(String matiereName);

}
