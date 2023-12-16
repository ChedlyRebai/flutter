package org.isetn.RestControllers;

import java.time.LocalDateTime;
import java.util.List;

import org.isetn.entities.Absence;
import org.isetn.repository.AbsenceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("absence")
public class AbsenceController {
	@Autowired
	private AbsenceRepository absenceRepository;

	@GetMapping("/getByMatiereClasseDate/{matiereId}/{codClass}/{date}")
	public List<Absence> getByMatiereClasseDate(
			@PathVariable Long matiereId,
			@PathVariable Long codClass,
			@PathVariable @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss") LocalDateTime date) {
		return absenceRepository.findByMatiereIdAndEtudiant_Classe_CodClassAndDate(matiereId, codClass, date);
	}

	@GetMapping("/getByEtudiantId/{etudiantId}")
	public List<Absence> findByClasseIdClas(@PathVariable("etudiantId") Long etudiantId) {
		return absenceRepository.findByEtudiantId(etudiantId);
	}

	@PostMapping("/add")
	public Absence add(@RequestBody Absence absence) {
		System.out.println(absence.toString());
		return absenceRepository.save(absence);
	}

	@GetMapping("/all")
	public List<Absence> getAll() {
		return absenceRepository.findAll();
	}

	@DeleteMapping("/delete")
	public void delete(@Param("id") Long id) {
		Absence abs = absenceRepository.findById(id).get();
		absenceRepository.delete(abs);
	}

	@PutMapping("/update")
	public Absence update(@RequestBody Absence absence) {
		return absenceRepository.save(absence);
	}
}
