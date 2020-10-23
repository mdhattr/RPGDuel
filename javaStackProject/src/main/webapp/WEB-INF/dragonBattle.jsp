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
                var healClick = 0;
                var statBoostClick = 0;
                var statBoost = 0;
                var heal = 0;
                var rightClick = 0;
                var leftClick = 0;
                var monsterHealth = ${ monster.health };
                var heroHealth = ${ hero.health };
                var monsterIncrease = ${ monster.strength };
                var statsIncreaseStrength = ${hero.strength};
                var statsIncreaseIntelligence = ${hero.intelligence};
                $(".enemyInfo, .buttons, .rightClickBtn, .leftClickBtn, #attack, .attack, .chooseAdvantage, .statBoostClick, .healBtnClick, #attackStatBoost, #attackHeal, .enemyInfo2, .enemyInfoImg").hide();
                $('.firstClick').click(function () {
                    if (clicks == 0) {
                        $(".storyText").prepend('<p>You have faced many trials to get to this point. You have only heard of the Dragons castle in stories and folk tales. To be able to say you were the one who slayed the almighty dragon will be the single greatest feat anyone can ever achieve. </p>');
                    } else if (clicks == 1) {
                        $(".storyText").prepend('<p>Before you face the Dragon, the slayer of worlds and king of this castle. You will have a choice ahead of you. Make sure you really think about your choice, because this can either make you or break you. This dragon will be the deadliest enemy up to this point.</p>');
                    } else if (clicks == 2) {
                        $(".storyText").prepend('<p>These will be the two choices, you must decide how you want to proceed. Always keeping in mind that the Dragon is a very strong foe, so choose Wisely. The first selection is a +20 strength and +20 intelligence. This will give a big advantage in the upcoming battle. The next selection will give your health points a boost of +200 before the battle! This can be a great advantage, but beware, the Dragon has ferocious attacks. </p>');
                        $(".chooseAdvantage").show();
                        $(".firstClick").hide();
                        $(".statBoostBtn").click(function () {
                            if (statBoost == 0) {
                                $(".chooseAdvantage").hide();
                                $(".statBoostClick").show();
                                $(".storyText").prepend('<p>You have chosen the stat boost for your character! This is a wise choice indeed. Hopefully it serves you well in your upcoming battle.</p>');
                                statsIncreaseStrength += 20;
                                statsIncreaseIntelligence += 20;
                                ++statBoost;
                                $(".statBoostClick").click(function () {
                                    if (statBoost == 1) {
                                        $(".storyText").prepend('<p>Now with a stat increase, it makes this last battle seem feasible, but it will still not be an easy task. There is a high possibility that we could die in this final battle.</p>');
                                    } else if (statBoost == 2) {
                                        $(".storyText").prepend('<p>Before you go into this battle you see something ahead that draws you in. There seems to be a light on in one of the rooms as your heading to the top of the castle to battle the dragon.</p>');
                                    } else if (statBoost == 3) {
                                        $(".storyText").prepend('<p>You enter the room and see a Beautiful princess in there. It seems she was awaiting your arrival. She tells you she has one last advantage that you can use against the dragon. Princess : Hello there traveler. I am the princess who has been trapped inside this Castle since the early days. I have been awaiting someone to come and save me for quite some time. Before you fight the dragon there is one last thing i can grant you so you stand a chance against the beast.</p>');
                                    } else if (statBoost == 4) {
                                        $(".storyText").prepend('<p>The dragon has a lot of strength. The princess can give you an elixir that can boost your health by an extra 100 points. It can help a lot against this beast!</p>');
                                    } else if (statBoost == 5) {
                                        heroHealth += 100;
                                        $(".storyText").prepend('<p>You have been given the elixir, and your health has increased by 100 points. It is now time to face the dragon and know your worth!!</p>');
                                    } else if (statBoost == 6) {
                                        $(".enemyInfo").show();
                                        $(".enemyInfoImg").show();
                                        $("#attackStatBoost").show();
                                        $(".statBoostClick").hide();
                                        $(".storyText").prepend('<p>The mighty Dragon has appeared!!</p>');
                                    }
                                    ++statBoost;
                                })
                            }
                        });
                        $(".healBtn").click(function () {
                            if (heal == 0) {
                                $(".chooseAdvantage").hide();
                                $(".healBtnClick").show();
                                $(".storyText").prepend('<p>You have chosen to go with the extra health. This is a wise choice indeed. Hopefully it serves you well.</p>');
                                heroHealth += 200;
                                ++heal;
                                $(".healBtnClick").click(function () {
                                    if (heal == 1) {
                                        $(".storyText").prepend('<p>Now with a health increase, it makes this last battle seem feasible, but it will still not be an easy task. There is a high possibility that we could die in this final battle.</p>');
                                    } else if (heal == 2) {
                                        $(".storyText").prepend('<p>Before you go into this battle you see something ahead that draws you in. There seems to be a light on in one of the rooms as your heading to the top of the castle to battle the dragon.</p>');
                                    } else if (heal == 3) {
                                        $(".storyText").prepend('<p>You enter the room and see a Beautiful princess in there. It seems she was awaiting your arrival. She tells you she has one last advantage that you can use against the dragon. Princess : Hello there traveler. I am the princess who has been trapped inside this Castle since the early days. I have been awaiting someone to come and save me for quite some time. Before you fight the dragon there is one last thing i can grant you so you stand a chance against the beast.</p>');
                                    } else if (heal == 4) {
                                        $(".storyText").prepend('<p>The dragon has a lot of strength. The princess can give you an elixir that can boost your stats by +10. It can help a lot against this beast!</p>');
                                    } else if (heal == 5) {
                                        statsIncreaseStrength += 10;
                                        statsIncreaseIntelligence += 10;
                                        $(".storyText").prepend('<p>You have been given the elixir, and your stats has been increaed by +10. It is now time to face the dragon and know your worth!!</p>');
                                    } else if (heal == 6) {
                                        $(".enemyInfo").show();
                                        $(".enemyInfoImg").show();
                                        $("#attackStatBoost").show();
                                        $(".healBtnClick").hide();
                                        $(".storyText").prepend('<p>The mighty Dragon has appeared!!</p>');
                                    }
                                    ++heal;
                                })

                            }
                        });
                    }

                    ++clicks;
                });
        $('#attackStatBoost').click(function () {
            var heroAttack = Math.floor(Math.random() * (statsIncreaseStrength) * 1.5)
            var monsterAttack = Math.floor(Math.random() * (monsterIncrease))
            monsterHealth-=heroAttack;
            heroHealth -= monsterAttack;
            alert('${hero.name} attacks ${monster.name} for ' + heroAttack + ' damage and receives ' + monsterAttack + ' damage in return');
            if (heroHealth < 0) {
                alert('You have been slain by the dragon! You lose, please try again young one.....')
                window.location.href = "/dashboard";
            }
            if (monsterHealth < 150) {
                alert('Something is happening, the Dragon seems to be getting stronger! (${monster.name} has entered its stage 2.It will not have a stat increase of +10 strength!')
                monsterIncrease += 10;
                if (heroHealth < 0) {
                    alert('You have been slain by the dragon! You lose, please try again young one.....')
                    window.location.href = "/dashboard";
                }
                $(".enemyInfoImg").hide();
                $(".enemyInfo2").show();
                $("#attackStatBoost").hide();
                $("#attackHeal").show();
                $('#attackHeal').click(function () {
                    var heroAttack = Math.floor(Math.random() * (statsIncreaseStrength) * 1.5)
                    var monsterAttack = Math.floor(Math.random() * (monsterIncrease))
                    monsterHealth-=heroAttack;
                    heroHealth -= monsterAttack;
                    if (heroHealth < 0) {
                        alert('You have been slain by the dragon! You lose, please try again young one.....')
                        window.location.href = "/dashboard";
                    }
                    alert('${hero.name} attacks ${monster.name} for ' + heroAttack + ' damage and receives ' + monsterAttack + ' damage in return');
                    if (monsterHealth < 0) {
                        alert('You have slain the dragon! You will forever be known as the one who killed this mighty beast!')
                        $(".enemyInfo2").hide();
                        $(".enemyInfo").hide();
                        $("#attackHeal").hide();
                        $('.rightClickBtn').show();
                        $(".storyText").prepend('<p>Now that dragon finally perished, you can save the princess and gain your rewards!.</p>');
                        $(".rightClickBtn").click(function () {
                            if (healClick == 0) {
                                $(".storyText").prepend('<p>You are a great Warrior indeed!</p>');
                            } else if (healClick == 1) {
                                window.location.href = "/dashboard";
                            }
                            ++healClick;
                        })
                    }
                });
            }
        });
                setInterval(function() {
                    $('#monsterHealth').text(monsterHealth);
                    $('#heroHealth').text(heroHealth);
                    $("#heroStrength").text(statsIncreaseStrength);
                    $('#monsterIncrease').text(monsterIncrease);
                }, 100);
        });
	</script>
</head>
<body>
    <div class="background" style="background-image: url(https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/df468634-20c9-45ec-ba4f-fe51c251f571/dcwndm6-da78996c-4262-44a2-b793-89022cb87088.gif?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvZGY0Njg2MzQtMjBjOS00NWVjLWJhNGYtZmU1MWMyNTFmNTcxXC9kY3duZG02LWRhNzg5OTZjLTQyNjItNDRhMi1iNzkzLTg5MDIyY2I4NzA4OC5naWYifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.TPG0L1sNa41EfTPjoTW-gQW3BXUWLy6uhT7igDeVj88); height: 100%; background-position: center; background-repeat: no-repeat;background-size: cover; height: 900px;">
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
                	<div class="col" id="monsterIncrease"></div>
                </div>
            </div>
            <div class="col-2 m-3 enemyInfoImg" style="height: 200px;">
                <img src="https://static.wikia.nocookie.net/metroid/images/c/cf/Neo_Ridley_Animation.gif/revision/latest?cb=20190512111320" class="img-fluid  mt-4" alt="Responsive image">
            </div>
            <div class="col-2 m-3 enemyInfo2" style="height: 200px;">
                <img src="https://cdn2.scratch.mit.edu/get_image/user/3213902_60x60.png" class="img-fluid  mt-4" alt="Responsive image">
            </div>
        </div>
        <div class="row mb-5">
            <div class="col-3">
                <p class="buttons"><button class="btn btn-danger leftBtn">Left</button> | <button
                        class="btn btn-danger rightBtn">Right</button></p>
                <p class="chooseAdvantage"><button class="btn btn-danger statBoostBtn">Boost Stats</button> | <button
                        class="btn btn-danger healBtn">Heal</button></p>
                <button class="btn btn-danger firstClick">Next</button>
                <button class="btn btn-danger rightClickBtn">Next</button>
                <button class="btn btn-danger leftClickBtn">Next</button>
                <button class="btn btn-danger statBoostClick">Next</button>
                <button class="btn btn-danger healBtnClick">Next</button>

            </div>
        </div>
        <div class="row mb-5" style="height:200px;">
            <div class="col"></div>
            <div class="col align-self-center"></div>
            <div class="col"></div>
        </div>
        <div class="row align-items-end">
            <div class="col-2 m-3" style="height: 200px;">
                <img src="${hero.imgURL}" class="img-fluid " alt="Responsive image">
                
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
                	<div class="col" id="heroStrength"></div>
                </div>
            </div>
            <div class="col-1 m-3 rounded-lg btn" id="attack"
            style="height: 120px; background-image:url(https://i.pinimg.com/originals/99/84/6c/99846ce56d56fb3914796cdb8f4b7833.png); background-size: cover;">
            <p class="btn text-danger" id="attack">Attack!</p>
            </div>
            <div class="col-1 m-3 rounded-lg btn" id="attackStatBoost"
                style="height: 120px; background-image:url(https://icon-library.com/images/icon-skull/icon-skull-13.jpg); background-size: cover;">
                <h3 class="btn text-danger">Attack Dragon!</h3>
            </div>
            <div class="col-1 m-3 rounded-lg btn" id="attackHeal"
                style="height: 120px; background-image:url(https://icon-library.com/images/icon-skull/icon-skull-13.jpg); background-size: cover;">
                <h3 class="btn text-danger">Attack Dragon!</h3>
            </div>
            <div class="col-5"></div>
        </div>
        <div class="row align-items-end">
        	<div class="col-10"></div>
        	<div class="col"><a href="/dashboard" class="text-white">Exit Campaign</a></div>
        </div> 
    </div>
</div>

</body>
</html>