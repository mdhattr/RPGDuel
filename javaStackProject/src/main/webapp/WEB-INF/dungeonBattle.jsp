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
                var secondRightClick=0;
                var secondLeftClick=0;
                $(".enemyInfo, .attackEnemy, .buttons, .rightClickBtn, .leftClickBtn, #attack, .attack, .chargedAttack").hide();
                $('.firstClick').click(function() {
                    if (clicks == 0){
                        $(".storyText").prepend('<p>Our Story starts out with our Hero inside of a dark and creepy dungeon </p>');
                    } else if (clicks == 1) {
                        $(".storyText").prepend('<p>There seems to be two paths ahead of you. Whatever you decide, will ultimately decide your fate. </p>');
                    } else if (clicks == 2) {
                        $(".storyText").prepend('<p>Now you need to make a decision. Either left or right. The right path is a dark corridor and is known to be inhabited by spiders and other creepy crawlers, but can be a longer route. The left path puts you in a larger room and is quicker to the goal, but has more difficult enemies, such as Goblins.  </p>');
                        $(".buttons").show();
                        $(".firstClick").hide();
                        $('.rightBtn').click(function() {
                            if (rightClick == 0) {
                                $(".buttons").hide();
                                $(".rightClickBtn").show();
                                $(".storyText").prepend('<p>You have chosen the right path. You are now progressing through the dark corridor. </p>');
                                ++rightClick;
                                $('.rightClickBtn').click(function() {
                                    if (rightClick == 1) {
                                    	$('#background').css('background-image', 'url(https://cdna.artstation.com/p/assets/images/images/006/315/366/large/taryn-meixner-dungeon-interior.jpg?1497628693)');
                                        $(".storyText").prepend('<p>You slowly traverse the corridor as to not disturb the spiders.</p>');
                                    } else if (rightClick == 2) {
                                        $(".storyText").prepend('<p>A spider jumps out to attack!!.</p>');
                                        $(".enemyInfo").show();
                                        $('.rightClickBtn').hide();
                                        $(".attackEnemy").show();
                                        $("#attack").show();
                                        $(".attack").show();
                                        
                                    }
                                    ++rightClick;
                                });
                            }
                        });
                        $('.leftBtn').click(function() {
                            if (leftClick == 0) {
                                $(".buttons").hide();
                                $("leftClickBtn").show();
                                $(".storyText").prepend('<p>You have chosen the left path. You now find yourself in a semi-lit room where you can hear the noises of what seem to be Goblins in the distance.')
                                window.location.href = "/battle/2";
                            }
                            ++leftClick;
                        });
                    }
                    ++clicks;
                });
                var monsterHealth=${monster.health}
                var heroHealth=${hero.health}
                var chargedAttack = 0;
            	$('#attack').click(function(){
                	var heroAttack=Math.floor(Math.random() * (${hero.strength}))
                	var monsterAttack=Math.floor(Math.random()*(${monster.strength}))
                	monsterHealth-=heroAttack;
                	heroHealth-=monsterAttack;
                	alert('${hero.name} attacks ${monster.name} for '+heroAttack+' damage and receives '+monsterAttack+' damage in return');     
                	++chargedAttack;
                    if (chargedAttack == 4) {
                        chargedAttack=0;
                        
                        $(".chargedAttack").show();
                        $(".attack").hide();
                        $("#attack").hide();
                        $(".chargedAttack").click(function () {
                            monsterHealth = -500;
                            if (monsterHealth<=0){
                                leftClick=5;
	                            alert("${hero.name} has used a Charged attack and killed ${monster.name}");
	                            chargedAttack = 0;
			                    alert('${monster.name} has perished. Congrats!')
			                    $(".enemyInfo").hide();
			                    $(".storyText").prepend('<p>With the spider defeated you look forward and see two paths ahead of you. To your left is a majestic looking oak door with an ornate and vaguely glowing door handle. To your right is an opening that looks like it leads down into a dark and ominous sewer.</p>');
			                    $(".buttons").show();
			                    $(".firstClick").hide();
			                    $(".rightClickBtn").hide();
			                    $('.rightBtn').click(function() {
			                    	if (secondRightClick == 0) {
			                            $(".buttons").hide();
			                            $(".rightClickBtn").show();
			                            $(".storyText").prepend('<p>You have chosen the right path. You are now progressing through ornate and glowing door. </p>');
			                            ++secondRightClick;
			                            $('.rightClickBtn').click(function() {
			                                if (secondRightClick == 1) {
			                                 $(".buttons").hide();
			                                    $("leftClickBtn").show();
			                                    window.location.href = "/battle/3";
			                                } 
			                                ++secondRightClick;
			                            });
			                        }
			                    });
			                    $('.leftBtn').click(function() {
			                        if (secondLeftClick == 0) {
			                            $(".buttons").hide();
			                            $("leftClickBtn").show();
			                            $(".storyText").prepend('<p>You have chosen the left path. You now find yourself in a semi-lit room where you can hear the noises of what seem to be Goblins in the distance.')
			                            window.location.href = "/battle/6";
			                        }
			                        ++secondLeftClick;
			                    });
                        } 	
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
    <div class="container-fluid" id="background" style="background-image: url(https://cdn.pixabay.com/photo/2019/10/31/15/41/dungeon-4592149_960_720.jpg); height: 800px; background-position: center; background-repeat: no-repeat;background-size: cover;">
        
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
                <img src="https://pixellicker.com/wp-content/uploads/2017/12/questin_boss_spider_4x.gif" class="img-fluid  mt-4" alt="Responsive image">
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
        <div class="row mb-5" style="height:150px">
            <div class="col"></div>
            <div class="col align-self-center"></div>
            <div class="col"></div>
        </div>
        <div class="row align-items-end">
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
            <div class="col-1 m-3 rounded-lg btn" id="attack" style="height: 120px; background-image:url(https://icon-library.com/images/icon-skull/icon-skull-14.jpg); background-size: cover;">
				<p class="btn text-white" id="attack">Attack!</p>
            </div>
            <div class="col-1 m-3 rounded-lg btn chargedAttack" style="height: 120px; background-image:url(https://icon-library.com/images/icon-skull/icon-skull-13.jpg); background-size: cover;">
            	<p class="btn text-white chargedAttack">Charged Attack!</p>
            </div>
            <div class="col-4"></div>
            <div class="col-5"></div>
        </div>
        <div class="row align-items-end">
        	<div class="col-10"></div>
        	<div class="col"><a href="/dashboard" class="text-white">Exit Campaign</a></div>
        </div> 
    </div>

</body>
</html>