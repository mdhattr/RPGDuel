package com.steven.javaStackProject.services;

import java.util.List;

import java.util.Optional;

import org.springframework.stereotype.Service;


import com.steven.javaStackProject.models.Hero;
import com.steven.javaStackProject.models.Monster;

import com.steven.javaStackProject.repositories.HeroRepository;
import com.steven.javaStackProject.repositories.MonsterRepository;

@Service
public class HeroService {

	private static HeroRepository heroRepo;
	private static MonsterRepository monRepo;
	
	public HeroService(HeroRepository heroRepo, MonsterRepository monRepo) {
		HeroService.heroRepo = heroRepo;
		HeroService.monRepo = monRepo;
	}
	
	public Hero create(Hero newHero) {
		return heroRepo.save(newHero);
	}
	
	public Monster create(Monster newMon) {
		return monRepo.save(newMon);
		
	}
    public Hero getHero(Long id) {
		Optional<Hero> potentialHero = heroRepo.findById(id);
		return potentialHero.isPresent() ? potentialHero.get() : null;
	}
	
	public List<Hero> getHeros() {
		return (List<Hero>) heroRepo.findAll();
	}
	
    public Monster getMonster(Long id) {
		Optional<Monster> monster = monRepo.findById(id);
		return monster.isPresent() ? monster.get() : null;
	}
    
    public Hero getHero(Long user_id, Long hero_id) {
		Optional<Hero> hero = heroRepo.findByUserIdAndHeroId(user_id, hero_id);
		return hero.isPresent() ? hero.get() : null;
	}
    
    public List<Hero> findHerosByUserId(Long user_id) {
    	return heroRepo.findHerosByUserId(user_id);
    }
    
    public Hero update(Hero toUpdate) {
		return heroRepo.save(toUpdate);
	}
    public Monster update(Monster toUpdate) {
		return monRepo.save(toUpdate);
	}
	
	
}
