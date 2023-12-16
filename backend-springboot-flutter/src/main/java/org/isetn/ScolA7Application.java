package org.isetn;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

import org.isetn.entities.Absence;
import org.isetn.entities.Classe;
import org.isetn.entities.Etudiant;
import org.isetn.entities.Formation;
import org.isetn.entities.Matiere;
import org.isetn.entities.User;
import org.isetn.repository.AbsenceRepository;
import org.isetn.repository.ClasseRepository;
import org.isetn.repository.EtudiantRepository;
import org.isetn.repository.FormationRepository;
import org.isetn.repository.MatiereRepository;
import org.isetn.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;

@SpringBootApplication
public class ScolA7Application implements CommandLineRunner {
	@Autowired
	private FormationRepository formationRepository;

	@Autowired
	private ClasseRepository classeRepository;

	@Autowired
	private EtudiantRepository etudiantRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private RepositoryRestConfiguration repositoryRestConfiguration;

	@Autowired
	private MatiereRepository matiereRepository;

	@Autowired
	private AbsenceRepository absenceRepository;

	public static void main(String[] args) {
		SpringApplication.run(ScolA7Application.class, args);
	}

	@Override
	public void run(String... args) throws Exception {

		Formation f1 = formationRepository.save(new Formation(null, "Oracle", 100, null));
		Formation f2 = formationRepository.save(new Formation(null, "J2EE", 10, null));
		Formation f3 = formationRepository.save(new Formation(null, "Angular", 120, null));

		Matiere m1 = matiereRepository.save(new Matiere(null, "Flutter", 1.5, 10.5));
		Matiere m2 = matiereRepository.save(new Matiere(null, "Devops", 1.5, 10.5));
		Matiere m3 = matiereRepository.save(new Matiere(null, "Springboot", 1.5, 10.5));

		Classe c1 = new Classe(null, "DSI31", 27, null);
		Classe c2 = new Classe(null, "DSI32", 25, null);
		Classe c3 = new Classe(null, "DSI33", 20, null);

		c1.getMatieres().add(m1);
		c1.getMatieres().add(m2);
		c2.getMatieres().add(m2);
		c2.getMatieres().add(m3);
		c3.getMatieres().add(m1);
		c3.getMatieres().add(m3);

		classeRepository.save(c1);
		classeRepository.save(c2);
		classeRepository.save(c3);

		User u1 = userRepository.save(new User(null, "admin@gmail.com", "admin"));
		SimpleDateFormat fdate = new SimpleDateFormat("dd-MM-yyyy");
		// new SimpleDateFormat("yyyy-mm-dd").parse("2020-01-01")
		Etudiant et1 = new Etudiant(null, "Ali", "Ben Ali", fdate.parse("10-03-2021"), f1, c1);
		etudiantRepository.save(et1);
		etudiantRepository.save(new Etudiant(null, "Mohamed", "Ben Mohamed", fdate.parse("1-04-2010"), f1, c1));
		etudiantRepository.save(new Etudiant(null, "Amin", "Ben Mahmoud", fdate.parse("19-07-2015"), f2, c1));
		etudiantRepository.save(new Etudiant(null, "Samia", "Ben Ahmed", fdate.parse("26-10-2014"), f3, c1));
		etudiantRepository.save(new Etudiant(null, "Foulen", "Ben Foulen1", fdate.parse("11-02-2018"), f3, c2));
		etudiantRepository.save(new Etudiant(null, "Foulen", "Ben Foulen2", new Date(), f3, c3));

		// add new absence
		LocalDateTime absenceDate = LocalDateTime.now();
		Absence ab1 = new Absence();
		ab1.setEtudiant(et1);
		ab1.setMatiere(m3);
		ab1.setAbsenceNb(1.5);
		ab1.setDate(absenceDate);
		absenceRepository.save(ab1);
	}
}
