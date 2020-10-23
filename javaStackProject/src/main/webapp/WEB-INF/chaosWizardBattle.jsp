<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
	<script>
		$(document).ready(
            function() {
            	var clicks = 0;
                var rightClick = 0;
                var leftClick = 0;
                var stairClick=0;
                $(".enemyInfo, .attackEnemy, .buttons, .rightClickBtn, .leftClickBtn, #attack, .attack").hide();
                $('.firstClick').click(function() {
                    if (clicks == 0){
                        $(".storyText").prepend('<p>You find yourself in a rather impressive looking library. You hear some demonic chanting coming from the middle of the room.</p>');
                    } else if (clicks == 1) {
                        $(".storyText").prepend('<p>As you delve deeper in the library towards the chanting, you feel a chill run up your spin</p>');
                    } else if (clicks == 2) {
                        $(".enemyInfo").show();
                        $(".storyText").prepend('<p>An ominous floating figure appears before, looking pretty upset that you interupted their spell casting.</p>');
                    } else if (clicks==3){
                    	$(".attack").show();
                    	$("#attack").show();
                    	$('.firstClick').hide();
                    }
                    ++clicks;
                });
                var monsterHealth=${monster.health}
                var heroHealth=${hero.health}
                var spellClick=0;
            	$('#attack').click(function(){
                	var heroAttack=Math.floor(Math.random() * (${hero.strength}))
                	var monsterAttack=Math.floor(Math.random()*(${monster.strength}))
                	monsterHealth-=heroAttack;
                	heroHealth-=monsterAttack;
                	alert('${hero.name} attacks ${monster.name} for '+heroAttack+' damage and receives '+monsterAttack+' damage in return');     
					if (heroHealth<15 && monsterHealth>0){
						$(".storyText").prepend('<p>Feeling weak and close to death, you hear the wizard caste a spell and feel yourself start to fade. You feel yourself falling into an eternal void.</p>');
						$(".heroInfo").hide();
						$('.firstClick').show();
						$('.firstClick').click(function() {
                            if (spellClick == 1) {
								window.location.href = "/battle/5";
                            } 
                        });
                        spellClick++
					}	
                	if (monsterHealth<=0){
                    	alert('${monster.name} has perished. Congrats!')
                    	$('.enemyInfo').hide();
						$('.firstClick').show();
                    	$(".storyText").prepend('<p>With the wizard destoryed the only path ahead of you is a long staircase spiralling upwards. Looks like this is the only way to go.</p>');
                    	$('.firstClick').click(function() {
                            if (stairClick == 0){
                                $(".storyText").prepend('<p>You start the long climb upwards.</p>');
                            } else if (stairClick == 1) {
                            	window.location.href = "/battle/7";
                            }
                            ++stairClick;
                        });
                    	}
                });
                setInterval(function() {
                    $('#monsterHealth').text(monsterHealth);
                    $('#heroHealth').text(heroHealth);
                }, 100);
    	});
	</script>
</head>
<body>
    <div class="container-fluid" id="background" style="background-image: url(https://external-preview.redd.it/943VzNVryHFT-7-TdmHc621ObQqJYzEzt2GvFrGGDMg.jpg?width=960&crop=smart&auto=webp&s=5c6fc7061b996383d65c1d1612aa0bdc9fbddd77); height: 800px; background-position: center; background-repeat: no-repeat;background-size: cover;">
        
        <div class="row align-items-start">
            <div class="col-5 bg-secondary m-3 rounded-lg border border-dark" style="height: 200px; overflow-y: scroll;">
                <div class="row">
                    <h5 class="text-white storyText"></h5>
                </div>
            </div>
            <div class="col"></div>
            <div class="col-3 bg-secondary m-3 rounded-lg border border-dark enemyInfo" style="height: 200px;">
                <div class="row text-white ml-3 mt-3">${monster.name } stats</div>
                <div class="row">
                	<div class="col">Type:</div>
                	<div class="col">${monster.type }</div>
                </div>
                <div class="row">
                	<div class="col">health:</div>
                	<div id="monsterHealth" class="col"></div>
                	<pre id="result"></pre>
                </div>
                <div class="row">
                	<div class="col">Strength:</div>
                	<div class="col">${monster.strength }</div>
                </div>
            </div>
            <div class="col-2 m-3 enemyInfo" style="height: 200px;">
                <img src="https://spadow.files.wordpress.com/2010/12/cygnus-sleep.gif?w=158&h=199" class="img-fluid mt-4" alt="Responsive image">
            </div>
        </div>
        <div class="row mb-5">
            <div class="col-3">
                <p class="buttons"><button class="btn btn-danger leftBtn">Left</button> | <button class="btn btn-danger rightBtn">Right</button></p>
                <button class="btn btn-danger firstClick">Next</button>
                <button class="btn btn-danger rightClickBtn">Next</button>
                <button class="btn btn-danger leftClickBtn">Next</button>
            </div>
        </div>
        <div class="row mb-5 " style="height:150px;">
            <div class="col"></div>
            <div class="col align-self-center"></div>
            <div class="col"></div>
        </div>
        <div class="row align-items-end heroInfo">
            <div class="col-2 m-3" style="height: 200px;">
                <img src="${hero.imgURL}" class="img-fluid" alt="Responsive image">
                
            </div>
            <div class="col-3 bg-secondary m-3 rounded-lg border border-dark mt-4" style="height: 200px;">
                                <div class="row text-white ml-3 mt-3">${hero.name } stats</div>
                <div class="row">
                	<div class="col">Type:</div>
                	<div class="col">${hero.type }</div>
                </div>
                <div class="row">
                	<div class="col">health:</div>
                	<div class="col" id="heroHealth"></div>
                </div>
                <div class="row">
                	<div class="col">Strength:</div>
                	<div class="col">${hero.strength }</div>
                </div>
            </div>
            <div class="col-1 m-3 rounded-lg btn" id="attack" style="height: 120px; background-image:url(https://i.pinimg.com/originals/99/84/6c/99846ce56d56fb3914796cdb8f4b7833.png); background-size: cover;">
				<p class="btn text-danger attack" id="attack">Attack!</p>
            </div>
            <div class="col-5"></div>
        </div>
        <div class="row align-items-end heroInfo">
        	<div class="col-10"></div>
        	<div class="col"><a href="/dashboard" class="text-white">Exit Campaign</a></div>
        </div> 
    </div>

</body>
</html>