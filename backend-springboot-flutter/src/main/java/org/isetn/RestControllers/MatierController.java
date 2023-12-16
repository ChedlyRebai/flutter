package org.isetn.RestControllers;

import java.util.List;

import org.isetn.entities.Classe;
import org.isetn.entities.Matiere;
import org.isetn.repository.ClasseRepository;
import org.isetn.repository.MatiereRepository;
import org.isetn.repository.AbsenceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("matier")

public class MatierController {
	@Autowired
	private MatiereRepository matierRepository;

	@Autowired
	private ClasseRepository classeRepository;

	@PostMapping("/add/{codClass}")
	public Matiere add(@PathVariable("codClass") Long codClass, @RequestBody Matiere matier) {
		System.out.println(matier.toString());

		// add matiere to this class id codClass
		classeRepository.findById(codClass).get().getMatieres().add(matier);
		return matierRepository.save(matier);
	}

	@GetMapping("/all")
	public List<Matiere> getAll() {
		return matierRepository.findAll();
	}

	@DeleteMapping("/delete")
	public void delete(@Param("id") Long id) {
		Matiere m = matierRepository.findById(id).get();
		matierRepository.delete(m);
	}

	@PutMapping("/update")
	public Matiere update(@RequestBody Matiere matier) {
		return matierRepository.save(matier);
	}
}
