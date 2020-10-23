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
                $(".enemyInfo, .attackEnemy, .buttons, .rightClickBtn, .leftClickBtn, #attack, .attack, .far, .closer, .win, .lose, .winBtn, .loseBtn, .loseBtn2").hide();
                $('.firstClick').click(function() {
                    if (clicks == 0){
                        $(".storyText").prepend('<p>You find yourself in a damp sewer. There are an alarming amount of snakes scattered throughout the sewer floors.</p>');
                    } else if (clicks == 1) {
                        $(".storyText").prepend('<p>As you continue your way through the sewer tunnel, you begin to hear what you think sounds like a nest of large serpents.</p>');
                    } else if (clicks == 2) {
                        $(".storyText").prepend('<p>You turn a corner and a monster slithered out from the darkness.</p>');
                    } else if (clicks == 3) {
						$('.enemyInfo').show();
                        $(".firstClick").hide();
                        $('.attack').show();
                        $('#attack').show();
                        $('.firstClick').hide();
                    } 
                    ++clicks;
                });
                var monsterHealth=${monster.health}
                var heroHealth=${hero.health}
                var blindClick=0;
                var rightClick=0;
                var leftClick=0;
                
                var leftClick2=0;
                var win=0;
                var lose=0;
                var win2=0;
                var lose2=0;
                var lose3=0;
                var rightClick2=0;
                var secondChance=0;
            	$('#attack').click(function(){
                	var heroAttack=Math.floor(Math.random() * (${hero.strength}))
                	var monsterAttack=Math.floor(Math.random()*(${monster.strength}))

                	monsterHealth-=heroAttack;
                	heroHealth-=monsterAttack;
                	alert('${hero.name} attacks ${monster.name} for '+heroAttack+' damage and receives '+monsterAttack+' damage in return');
                	if (heroHealth<=0){
                		$(".storyText").prepend('<p>The monster slithers behind you and you feel her many fangs sink into your soft flesh. This is the end of your story</p>');
                		$('.attack').hide();
                		$('#attack').hide();
                		$('.heroInfo').hide();
                		$('.loseBtn2').show();
                		$('.loseBtn2').click(function() {
    	            		if (lose3 == 0){
    	            			window.location.href = "/dashboard";	
    	            		} 
    	            		++lose3;
    	            		});
                    	}     
					if (heroHealth<100 && secondChance==0){
						$('.attack').hide();
                        $('#attack').hide();
                        $(".storyText").prepend('<p>The monster is very strong and you are not sure if you will be able to defeat it without changing your strategy.</p>');
                        $(".firstClick").show();
					}
					$('.firstClick').click(function() {
						if (blindClick == 0){
							
							$(".storyText").prepend('<p>You have two options. Either continue fighting the Monster like you are, or try to get close enough to chop off its head. The hissing serpents on its head dont instill you with a lot of confidence. </p>');
						} else if (blindClick == 1) {
							$('.far').show();
							$('.closer').show();
							$('.firstClick').hide();
						} 
						++blindClick;
					});
					$('.closer').click(function() {
						if (rightClick == 0){
							$('.far').hide();
							$('.closer').hide();
							$('.rightClickBtn').show();
							$(".storyText").prepend('<p>You decide that getting closer is worth the risk. You are positive that you cannot beat the beast without using a different tactic</p>');
						}
						++rightClick
						 
					});
					$('.far').click(function() {
						if (leftClick == 0){
							$('.far').hide();
							$('.closer').hide();
							$('.leftClickBtn').show();
							$(".storyText").prepend('<p>You decide not to risk it and continue as you were</p>');
							secondChance=1
						} else if (leftClick == 1){
							$('.attack').show();
							$('#attack').show();
							$('.leftClickBtn').hide();
						}
						++leftClick
						 
					});
					
					$('.rightClickBtn').click(function() {
						if (rightClick2 == 0){
							$(".storyText").prepend('<p>As you charge at the monster, the serpents on its head rear back and spit venom at you, landing right in your eyes. You scream out as you feel your eyesight fading to blackness.You can no longer see anything. You have to find where to swing</p>');
						} else if (rightClick2 == 1){
							
						} else if (rightClick2 == 2){
							$('.enemyInfo').hide();
							$('.heroInfo').hide();
							$('.attack').hide();
							$('#background').css('background-image', 'url(https://wallpapercave.com/wp/wp3597484.jpg)');
							$('.attack').hide();
							$('#attack').hide();
							$('.lose').show();
							$('.win').show();
						} else if (rightClick2 == 3){
							
							$('.rightClickBtn').hide();
						}
						++rightClick2;
					});
                	if (monsterHealth<0){
                    	alert('${monster.name} has perished. Congrats!')
                    	$(".storyText").prepend('<p>With the spider defeated you look forward and see two paths ahead of you.</p>');
                    	
                    	}
                });
            	$('.win').click(function() {
            		if (win == 0){
            			$(".storyText").prepend('<p>You swing blindly into the darkness and feel your weapon sink into the monsters neck. Chopping it clean off</p>');
            			$('.winBtn').show();
            		 } 
            		win=1;
            	});
            	$('.lose').click(function() {
            		if (lose == 0){
            			$(".storyText").prepend('<p>You swing blindly into the darkness and do not feel your weapon make contact</p>');
            			$('.loseBtn').show();
            			$('.rightClickBtn').hide();
            		 } 
            		lose++;
            	});
					$('.winBtn').click(function() {
            		if (win2 == 0){
            			$(".storyText").prepend('<p>Your eyesight slowly comes back to you</p>');
            		} else if (win2==1){
            			$('.heroInfo').show();
            			$('#background').css('background-image', 'url(https://i.pinimg.com/originals/3b/a8/b3/3ba8b3c1c3b30f1529363b99f68d5c83.jpg)');
            			$('.lose').hide();
            			$('.win').hide();
            			alert('${monster.name} has perished. Congrats!')
            		 } else if (win2==2){
            			 $(".storyText").prepend('<p>You continue through the sewer and head towards an opening.</p>');
                	 } else if (win2==3){
            			 $(".storyText").prepend('<p>You see ahead to what seems like a lost tomb, who knows what lurks beyond....</p>');
                	 }else if (win2==4){
                		 window.location.href = "/battle/4";
                	 }
            		++win2;
            		});
					$('.loseBtn').click(function() {
	            		if (lose2 == 0){
	            			$(".storyText").prepend('<p>You hear the monster behind you and feel her many fangs sink into your soft flesh. This is the end of your story</p>');
	            		} else if (lose2==1){
	            			$('.enemyInfo').show();
	            			$('#background').css('background-image', 'url(https://i.pinimg.com/originals/3b/a8/b3/3ba8b3c1c3b30f1529363b99f68d5c83.jpg)');
	            			$('.lose').hide();
	            			$('.win').hide();
	            		 } else if (lose2==2){
	            			 window.location.href = "/dashboard";
	                	 } 
	            		++lose2;
	            		});
                
            	
                setInterval(function() {
                    $('#monsterHealth').text(monsterHealth);
                    $('#heroHealth').text(heroHealth);
                }, 100);
    	});
	</script>
</head>
<body>
    <div class="container-fluid" id="background" style="background-image: url(https://i.pinimg.com/originals/3b/a8/b3/3ba8b3c1c3b30f1529363b99f68d5c83.jpg); height: 850px; background-position: center; background-repeat: no-repeat;background-size: cover;">
        
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
                <img src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/5d0257a7-3486-47d1-9695-64179c3f1d58/ddlmlno-2cf4ec53-bf7c-4d87-acfd-eabce7777c58.gif?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvNWQwMjU3YTctMzQ4Ni00N2QxLTk2OTUtNjQxNzljM2YxZDU4XC9kZGxtbG5vLTJjZjRlYzUzLWJmN2MtNGQ4Ny1hY2ZkLWVhYmNlNzc3N2M1OC5naWYifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.Wgkqscjhup2rlpmZaFnjrDDUHQ46z7pE9WuUH4Tvx4A" class="img-fluid  mt-4" alt="Responsive image">
            </div>
        </div>
        <div class="row mb-5">
            <div class="col-3">
                <p class="buttons"><button class="btn btn-danger leftBtn">Left</button> | <button class="btn btn-danger rightBtn">Right</button></p>
                <p><button class="btn btn-danger far">Keep your distance</button> | <button class="btn btn-danger closer">Get closer</button> </p>
                <button class="btn btn-danger firstClick">Next</button>
                <button class="btn btn-danger rightClickBtn">Next</button>
                <button class="btn btn-danger leftClickBtn">Next</button>
                <button class="btn btn-danger winBtn">Next</button>
                <button class="btn btn-danger loseBtn">Next</button>
                <button class="btn btn-danger loseBtn2">Next</button>
            </div>
        </div>
        <div class="row mb-5" style="height:150px;">
            <div class="col"><a style="color:black" class="win">You swing and chop her head off</a></div>
            <div class="col align-self-center"></div>
            <div class="col"><a style="color:black" class="lose">You swing and miss entirely</a></div>
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
            <div class="col-1 m-3 rounded-lg btn" id="attack" style="height: 120px; background-image:url(https://icon-library.com/images/icon-skull/icon-skull-14.jpg); background-size: cover;">
				<p class="btn text-white attack" id="attack">Attack!</p>
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