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
                var hammerClick = 0;
                var legendSwordClick = 0;
                var legendSword = 0;
                var hammer = 0;
                $(".enemyInfo, .buttons, .rightClickBtn, .leftClickBtn, #attack, .attack, .chooseWeapon, .legendSwordBtnClick, .hammerBtnClick, #attacklegendSword, #attackHammer").hide();
                $('.firstClick').click(function () {
                    if (clicks == 0) {
                        $(".storyText").prepend('<p>Now that you have entered the lost tomb. You think back about your journey and what it took to get here. We need to be careful though. There are rumors that a Golum lives in these tombs. </p>');
                    } else if (clicks == 1) {
                        $(".storyText").prepend('<p>You see a couple weapons in the distance! One is shining really bright, and looks to be really powerful and expensive!</p>');
                    } else if (clicks == 2) {
                        $(".storyText").prepend('<p>You get to the weapons and one of them looks like an old raggedy hammer that looks like it could do some damage, but not a lot. The one next to it looks like the coveted Legendary Sword of Sir John the Great! It is gold encrusted, with diamonds and jewels and looks like it can take down a dragon. You must think hard on which one to choose.</p>');
                        $(".chooseWeapon").show();
                        $(".firstClick").hide();
                        $(".legendSwordBtn").click(function () {
                            if (legendSword == 0) {
                                $(".chooseWeapon").hide();
                                $(".legendSwordBtnClick").show();
                                $(".storyText").prepend('<p>You have chosen to continue with the almighty and powerful Legendary Sword! There is no way you can lose now!</p>');
                                ++legendSword;
                                $(".legendSwordBtnClick").click(function () {
                                    if (legendSword == 1) {
                                        $(".storyText").prepend('<p>With the new all powerful legendary sword, you are feeling on top of the world! There is nothing that can stand in your way!!</p>');
                                    } else if (legendSword == 2) {
                                        $(".enemyInfo").show();
                                        $("#attacklegendSword").show();
                                        $('.legendSwordBtnClick').hide();
                                        $(".storyText").prepend('<p>Just then, a Golum appears!</p>');
                                        
                                        $('#attacklegendSword').click(function () {
                                            if (legendSwordClick == 0) {
                                            $(".storyText").prepend('<p>You tried to attack, but something is happening. Try and Attack again!!</p>');
                                            } else if (legendSwordClick == 1) {
                                                window.location.href = "/battle/5";
                                            }
                                            ++legendSwordClick;
                                        });
                                    }
                                    ++legendSword;
                                })
                            }
                        });
                        $(".hammerBtn").click(function () {
                            if (hammer == 0) {
                                $(".chooseWeapon").hide();
                                $(".hammerBtnClick").show();
                                $(".storyText").prepend('<p>You really liked the look and feel of the legendary Sword, but you ultimately decide to go with the Hammer, it just seems like the safer choice. The legendary sword was just too good to be true.</p>');
                                ++hammer;
                                $(".hammerBtnClick").click(function () {
                                    if (hammer == 1) {
                                        $(".storyText").prepend('<p>With Hammer in hand, you continue searching the tomb for other treasures. You spot a boulder that looks to out of place for its own good. You walk up to it. But as you close in on it, the rocks around your feet start to shake, this is not good.....</p>');
                                    } else if (hammer == 2) {
                                        $(".enemyInfo").show();
                                        $("#attackHammer").show();
                                        $('.hammerBtnClick').hide();
                                        $(".storyText").prepend('<p>A Golum has appeared!</p>');
                                    }
                                    ++hammer;
                                })

                            }
                        });
                    }

                    ++clicks;
                });
        var monsterHealth = ${ monster.health };
        var heroHealth = ${ hero.health };
        $('#attackHammer').click(function () {
            var heroAttack = Math.floor(Math.random() * (${ hero.strength }) * 2.5)
            var monsterAttack = Math.floor(Math.random() * (${ monster.strength }))
            monsterHealth-=heroAttack;
            heroHealth -= monsterAttack;
            alert('${hero.name} attacks ${monster.name} with a Hammer for ' + heroAttack + ' damage and receives ' + monsterAttack + ' damage in return');
            if (heroHealth < 0) {
                alert('You have been slain by the Golum! You lose, please try again young one.....')
                window.location.href = "/dashboard";
            }
            if (monsterHealth < 0) {
                alert('${monster.name} has perished. Your weapon doesnt seem to make it out of the battle. But that was a powerful enemy!')
                $(".hammerBtnClick").show();
                $(".enemyInfo").hide();
                $("#attackHammer").hide();
                $(".storyText").prepend('<p>With the golum dead, you look around at the carnage that was caused during your encounter. You spot a staircase that looks to be never ending. You start up the staircase to see what else awaits.</p>');
                $(".hammerBtnClick").click(function () {
                    if (hammerClick == 0) {
                        $(".storyText").prepend('<p>While going up the staircase, you find a potion to heal all of your wounds and continue up.....</p>');
                    } else if (hammerClick == 1) {
                        window.location.href = "/battle/7";
                    }
                    ++hammerClick;
                })
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
    <div class="background" style="background-image: url(https://www.gamergeoff.com/wp-content/uploads/2017/01/door-in-darkness-4.gif); background-position: center; background-repeat: no-repeat;background-size: cover; height: 800px;">
    <div class="container-fluid" id="background">
        
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
                <img src="https://lh3.googleusercontent.com/proxy/aAmMex1emflhDBcyBZCy9C2c0r62jnFFlS0D3C5LqzJcUj2beCSO9T622zwGwbPUzOXHze9UXJ7sBTZx_yNbe2cU2RhgZWiiyDXNx8huTEOkWg" class="img-fluid  mt-4" alt="Responsive image">
            </div>
        </div>
        <div class="row mb-5">
            <div class="col-3">
                <p class="buttons"><button class="btn btn-danger leftBtn">Left</button> | <button
                        class="btn btn-danger rightBtn">Right</button></p>
                <p class="chooseWeapon"><button class="btn btn-danger legendSwordBtn">Legendary Sword</button> | <button
                        class="btn btn-danger hammerBtn">Raggedy Hammer</button></p>
                <button class="btn btn-danger firstClick">Next</button>
                <button class="btn btn-danger rightClickBtn">Next</button>
                <button class="btn btn-danger leftClickBtn">Next</button>
                <button class="btn btn-danger legendSwordBtnClick">Next</button>
                <button class="btn btn-danger hammerBtnClick">Next</button>

            </div>
        </div>
        <div class="row mb-5" style="height:150px;">
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
            <div class="col-1 m-3 rounded-lg btn" id="attack"
                style="height: 120px; background-image:url(https://i.pinimg.com/originals/99/84/6c/99846ce56d56fb3914796cdb8f4b7833.png); background-size: cover;">
                <p class="btn text-danger" id="attack">Attack!</p>
            </div>
            <div class="col-1 m-3 rounded-lg btn" id="attackHammer"
                style="height: 120px; background-image:url(https://icon-library.com/images/icon-skull/icon-skull-13.jpg); background-size: cover;">
                <h3 class="btn text-danger">Attack With Hammer!</h3>
            </div>
            <div class="col-1 m-3 rounded-lg btn" id="attacklegendSword"
                style="height: 120px; background-image:url(https://icon-library.com/images/icon-skull/icon-skull-13.jpg); background-size: cover;">
                <h3 class="btn text-danger">Attack With Legendary Sword!</h3>
            </div>
            <div class="col-4"></div>
        </div>
        <div class="row align-items-end">
        	<div class="col-10"></div>
        	<div class="col"><a href="/dashboard" class="text-white">Exit Campaign</a></div>
        </div> 
    </div>
</div>

</body>
</html>