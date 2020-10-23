package com.steven.javaStackProject.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


import com.steven.javaStackProject.models.Hero;

@Repository
public interface HeroRepository extends CrudRepository<Hero, Long> {

	@Query(value="SELECT * FROM heros WHERE user_id = ?1 AND hero_id=?2)", nativeQuery=true)
	Optional<Hero> findByUserIdAndHeroId(Long user_id, Long hero_id);
	
	@Query(value="SELECT * FROM heros WHERE user_id = ?1", nativeQuery=true)
	List<Hero> findHerosByUserId(Long user_id);
	
	
	
}
