package com.steven.javaStackProject.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.steven.javaStackProject.models.Monster;

@Repository
public interface MonsterRepository extends CrudRepository<Monster, Long>{

}
