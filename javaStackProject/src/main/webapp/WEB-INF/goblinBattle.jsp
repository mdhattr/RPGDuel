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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    <script>
        $(document).ready(
            function () {
                var clicks = 0;
                var daggerClick = 0;
                var waraxeClick = 0;
                var waraxe = 0;
                var dagger = 0;
                $(".enemyInfo, .buttons, .rightClickBtn, .leftClickBtn, #attack, .attack, .chooseWeapon, .dagBtnClick, .warBtnClick, #attackDagger, #attackWaraxe").hide();
                
                $('.firstClick').click(function () {
                    if (clicks == 0) {
                        $(".storyText").prepend('<p>So far it doesnt seem like the Goblins can hear you in the room.</p>');
                    }  else if (clicks == 1) {
                        $(".storyText").prepend('<p>You spot two weapons on the floor, a War Axe that looks like it has seen some better day, but looks like it can do some damage. And a dagger that looks brand new, but is rather small. Please Choose a weapon.</p>');
                        $(".chooseWeapon").show();
                        $(".firstClick").hide();
                        $(".warBtn").click(function () {
                            if (waraxe == 0) {
                                $(".chooseWeapon").hide();
                                $(".warBtnClick").show();
                                $(".storyText").prepend('<p>You have chosen to continue with the War Axe.</p>');
                                ++waraxe;
                                $(".warBtnClick").click(function () {
                                    if (waraxe == 1) {
                                        $(".storyText").prepend('<p>Now that you are equiped with a War Axe you continue on your journey feeling relieved and safe with a weapon, but the War Axe is a bit heavy, and you stumble right into an enemy.....</p>');
                                    } else if (waraxe == 2) {
                                        $(".enemyInfo").show();
                                        $("#attackWaraxe").show();
                                        $(".storyText").prepend('<p>A Goblin has appeared!</p>');
                                        $('.warBtnClick').hide();
                                    }
                                    ++waraxe;
                                })
                            }
                        });
                        $(".dagBtn").click(function () {
                            if (dagger == 0) {
                                $(".chooseWeapon").hide();
                                $(".dagBtnClick").show();
                                $(".storyText").prepend('<p>You have chosen to continue with the Dagger.</p>');
                                ++dagger;
                                $(".dagBtnClick").click(function () {
                                    if (dagger == 1) {
                                        $(".storyText").prepend('<p>Now that you are equiped with a dagger you continue on your journey feeling relieved and safe with a weapon, but feeling too confident, you run right into an enemy.....</p>');
                                    } else if (dagger == 2) {
                                        $(".enemyInfo").show();
                                        $("#attackDagger").show();
                                        $(".storyText").prepend('<p>A Goblin has appeared!</p>');
                                        $('.dagBtnClick').hide();
                                    }
                                    ++dagger;
                                })

                            }
                        });
                    }

                    ++clicks;
                });
        var monsterHealth = ${ monster.health };
        var heroHealth = ${ hero.health };
        $('#attackDagger').click(function () {
            var heroAttack = Math.floor(Math.random() * (${ hero.strength }) * 2.5)
            var monsterAttack = Math.floor(Math.random() * (${ monster.strength }))
            monsterHealth-=heroAttack;
            heroHealth -= monsterAttack;
            alert('${hero.name} attacks ${monster.name} with a Dagger for ' + heroAttack + ' damage and receives ' + monsterAttack + ' damage in return');
            if (monsterHealth < 0) {
                alert('${monster.name} has perished. But it looks like your weapon has been destroyed in the process.')
                $(".enemyInfo").hide();
                $('.dagBtnClick').show();
                $("#attackDagger").hide();
                $(".storyText").prepend('<p>Now that you have Defeated the Goblin, it is time to continue the journey.</p>');
                $(".dagBtnClick").click(function () {
                    if (daggerClick == 0) {
                        $(".storyText").prepend('<p>You now continue on to what seems like a lost tomb, who knows what lurks beyond....</p>');
                    } else if (daggerClick == 1) {
                        window.location.href = "/battle/4";
                    }
                    ++daggerClick;
                })
            }
        });
        $('#attackWaraxe').click(function () {
            var heroAttack = Math.floor(Math.random() * (${ hero.strength }) * 4.5)
            var monsterAttack = Math.floor(Math.random() * (${ monster.strength }))
            monsterHealth-=heroAttack;
            heroHealth -= monsterAttack;
            alert('${hero.name} attacks ${monster.name} with a WarAxe for ' + heroAttack + ' damage and receives ' + monsterAttack + ' damage in return');
            if (monsterHealth < 0) {
                alert('${monster.name} has perished. But it looks like your weapon has been destroyed in the process.')
                $(".enemyInfo").hide();
                $('.warBtnClick').show();
                $("#attackWaraxe").hide();
                $(".storyText").prepend('<p>Now that you have Defeated the Goblin, it is time to continue the journey.</p>');
                $(".warBtnClick").click(function () {
                    if (waraxeClick == 0) {
                        $(".storyText").prepend('<p>You now continue on to what seems like a lost tomb, who knows what lurks beyond....</p>');
                    } else if (waraxeClick == 1) {
                        window.location.href = "/battle/4";
                    }
                    ++waraxeClick;
                })
            }
        });
        setInterval(function () {
            $('#monsterHealth').text(monsterHealth);
            $('#heroHealth').text(heroHealth);
        }, 100);
        });
    </script>
</head>

<body>
    <div class="background" style="background-image: url(https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/12496ab1-6b98-48b2-8e9a-2828ffd841f1/dcxybli-197e5774-0a8e-4576-9cbc-f379808b5fbf.gif?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvMTI0OTZhYjEtNmI5OC00OGIyLThlOWEtMjgyOGZmZDg0MWYxXC9kY3h5YmxpLTE5N2U1Nzc0LTBhOGUtNDU3Ni05Y2JjLWYzNzk4MDhiNWZiZi5naWYifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.j5fkSgOk-dNl8w5ahcxH6ERRegTCtp_BQMEhczZJ0yA); height: 100%; background-position: center; background-repeat: no-repeat;background-size: cover; height: 900px;">
    <div class="container-fluid" id="background">
        <div class="row align-items-start">
            <div class="col-5 bg-secondary m-3 rounded-lg border border-dark"
                style="height: 200px; overflow-y: scroll;">
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
                <img src="https://img.itch.zone/aW1nLzE5MzM0NDIuZ2lm/original/rXNew5.gif"
                    class="img-fluid mt-4" alt="Responsive image">
            </div>
        </div>
        <div class="row mb-5">
            <div class="col-3">
                <p class="buttons"><button class="btn btn-danger leftBtn">Left</button> | <button
                        class="btn btn-danger rightBtn">Right</button></p>
                <p class="chooseWeapon"><button class="btn btn-danger warBtn">Old War Axe</button> | <button
                        class="btn btn-danger dagBtn">New Dagger</button></p>
                <button class="btn btn-danger firstClick">Next</button>
                <button class="btn btn-danger rightClickBtn">Next</button>
                <button class="btn btn-danger leftClickBtn">Next</button>
                <button class="btn btn-danger warBtnClick">Next</button>
                <button class="btn btn-danger dagBtnClick">Next</button>

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
                    <div class="col">${hero.strength }</div>
                </div>
            </div>
            <div class="col-1 m-3 rounded-lg btn" id="attack"
                style="height: 120px; background-image:url(https://i.pinimg.com/originals/99/84/6c/99846ce56d56fb3914796cdb8f4b7833.png); background-size: cover;">
                <p class="btn text-danger" id="attack">Attack!</p>
            </div>
            <div class="col-1 m-3 rounded-lg btn" id="attackDagger"
                style="height: 120px; background-image:url(https://icon-library.com/images/icon-skull/icon-skull-13.jpg); background-size: cover;">
                <h3 class="btn text-danger">Attack With Dagger!</h3>
            </div>
            <div class="col-1 m-3 rounded-lg btn" id="attackWaraxe"
                style="height: 120px; background-image:url(https://icon-library.com/images/icon-skull/icon-skull-13.jpg); background-size: cover;">
                <h3 class="btn text-danger">Attack With WarAxe!</h3>
            </div>
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