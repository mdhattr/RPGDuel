package com.steven.javaStackProject.controllers;

import java.util.List;


import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;


import com.steven.javaStackProject.models.Hero;

import com.steven.javaStackProject.models.User;
import com.steven.javaStackProject.services.HeroService;

@Controller
public class HomeController {

	
	private static HeroService heroServ;
	
	public HomeController(HeroService heroServ) {
		HomeController.heroServ = heroServ;
	}
	
	@GetMapping("/dashboard")
    public String eventHome(Model model, HttpSession session) {
    	User loggedInUser = (User) session.getAttribute("user");
		if(loggedInUser == null) {
			return "redirect:/login";
		}

		List<Hero> findHerosByUserId=heroServ.findHerosByUserId(loggedInUser.getId());
		model.addAttribute("allHeros", findHerosByUserId);
		return "home.jsp";
    }
	
	@GetMapping("/createHero")
	public String createCharacter(HttpSession session, Model model) {
		User loggedInUser = (User) session.getAttribute("user");
		if(loggedInUser == null) {
			return "redirect:/login";
		}
		model.addAttribute("newHero", new Hero());
		return "newHero.jsp";
	}
	
	@PostMapping("/processHero")
	public String processHero(@Valid @ModelAttribute("newHero") Hero newHero,
    		BindingResult result, Model model, HttpSession session) {
		if(result.hasErrors()) {
			return "newHero.jsp";
		} else {
			User loggedInUser = (User) session.getAttribute("user");
			newHero.setUser(loggedInUser);
			if(newHero.getType().equals("Warrior")) {
				newHero.setStrength(20);
				newHero.setIntelligence(10);
				newHero.setSneak(10);
				newHero.setImgURL("https://thumbs.gfycat.com/InbornConcreteGlowworm-max-1mb.gif");
			} else if(newHero.getType().equals("Wizard")) {
				newHero.setStrength(10);
				newHero.setIntelligence(20);
				newHero.setSneak(10);
				newHero.setImgURL("https://art.pixilart.com/985c406d0d61147.png");
			}
			heroServ.create(newHero);
			return "redirect:/dashboard";
		}
	}
	@GetMapping("heros/{id}")
	public String HeroInfo(Model model, HttpSession session, @PathVariable("id") Long id) {
		Hero usedHero = heroServ.getHero(id);
		session.setAttribute("hero", usedHero);
		
		return "heroInfo.jsp";
	}
	
	@GetMapping("/battle/{id}")
    public String battle(Model model, HttpSession session, @PathVariable("id") Long id) {
    	Hero usedHero = (Hero) session.getAttribute("hero");

		model.addAttribute("monster", heroServ.getMonster(id));
		model.addAttribute("hero", usedHero);
		if (id==2) {
			return "goblinBattle.jsp";
		}
		if (id==3) {
			return "chaosWizardBattle.jsp";
		}
		if (id==4) {
			return "golumBattle.jsp";
		}
		if (id==5) {
			return "bugMonsterBattle.jsp";
		}
		if (id==6) {
			return "medusaBattle.jsp";
		}
		if (id==7) {
			return "dragonBattle.jsp";
		}
		if (id==8) {
			return "emptyLibrary.jsp";
		}
		
		return "dungeonBattle.jsp";
    }
	
	
}
