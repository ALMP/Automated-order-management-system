<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>ASCOM</title>

    <!-- Bootstrap -->
    <link href="${contextPath}/webresources/static/need/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${contextPath}/webresources/static/need/css/style.css">
    <link rel="stylesheet" href="${contextPath}/webresources/static/need/css/font-awesome.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<header>
    <div class="container">
        <div class="row">
            <div class="col-sm-2 logotype">
                <img src="${contextPath}/webresources/static/need/img/logo.png" alt="Логотип Компании" class="img-responsive">
            </div>
            <div class="col-sm-7 text-center descript">
                <h4>automated system for customer order management</h4>
                <h5>ASCOM</h5>
            </div>
            <div class="col-sm-3 phone_number">
                <h3><a href="+375298715105">(29) 4-8-15-16-23-42</a></h3>
                <p>Library hours: from 8<sup>30</sup> to 18<sup>30</sup></p>
            </div>
        </div>
    </div>
</header>

<nav id="top_nav" >
    <div class="container">
        <div class="row">
            <ul class="list-inline">
                <a href="#main">
                    <li>Home</li>
                </a>
                <a href="#who">
                    <li>About us</li>
                </a>
                <a href="#portfolio">
                    <li>Portfolio</li>
                </a>
                <a href="#contacts">
                    <li>Contact Information</li>
                </a>
                <c:if test="${us != null}">
                    <a href="${contextPath}/cabinet/cabinet">
                        <li>ACCOUNT</li>
                    </a>
                    <a href="${contextPath}/logout">
                        <li>SING OUT</li>
                    </a>
                </c:if>
                <c:if test="${us == null}">
                    <a href="${contextPath}/login">
                        <li>SING IN</li>
                    </a>
                    <a href="${contextPath}/registration">
                        <li>REGISTRATION</li>
                    </a>
                </c:if>
                <c:if test="${ADM == true}">
                    <a href="${contextPath}/adm">Admin</a>
                </c:if>
            </ul>
        </div>
    </div>
</nav>

<section id="main">
    <div class="container">
        <div class="row main_header">
            <h1><span>We are engaged in wholesale distribution of goods around the world.For more than 20 years.</span></h1>
        </div>
        <div class="row">
            <h3>In 10 countries. On 4 continents.<span> <br>Reliability, professionalism, fanatical care about our customers.</span></h3>
        </div>
        <div class="row main_buttons">
        </div>
    </div>
</section>


<section id="who">
    <div class="container">
        <div class="page-header">
            <h1 class="text-center">Who are we?</h1>
        </div>
        <p class="lead text-center">Our success depends on our ability to provide optimum service to you and your shareholders. Our staff is efficient, productive, and flexible in addressing the specialized needs of each client.</p>
        <div class="container">
            <div class="row stylish-panel">
                <div class="col-md-4">
                    <div>
                        <img src="http://lorempixel.com/200/200/business/1/" alt="Texto Alternativo" class="img-circle img-thumbnail">
                        <h2>Head of Department</h2>
                        <p>The overman...Who has organized the chaos of his passions, given style to his character, and become creative. Aware of life's terrors, he affirms life without resentment.
                        </p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div>
                        <img src="http://lorempixel.com/200/200/business/2/" alt="Texto Alternativo" class="img-circle img-thumbnail">
                        <h2>Power Engineer</h2>
                        <p>The overman...Who has organized the chaos of his passions, given style to his character, and become creative. Aware of life's terrors, he affirms life without resentment.
                        </p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div>
                        <img src="http://lorempixel.com/200/200/business/3/" alt="Texto Alternativo" class="img-circle img-thumbnail">
                        <h2>Logistic Department</h2>
                        <p>The overman...Who has organized the chaos of his passions, given style to his character, and become creative. Aware of life's terrors, he affirms life without resentment.
                        </p>
                    </div>
                </div>
            </div>
            <div class="row stylish-panel">
                <div class="col-md-4">
                    <div>
                        <img src="http://lorempixel.com/200/200/business/4/" alt="Texto Alternativo" class="img-circle img-thumbnail">
                        <h2>Transport Manager</h2>
                        <p>The overman...Who has organized the chaos of his passions, given style to his character, and become creative. Aware of life's terrors, he affirms life without resentment.
                        </p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div>
                        <img src="http://lorempixel.com/200/200/business/5/" alt="Texto Alternativo" class="img-circle img-thumbnail">
                        <h2>Marketing Director</h2>
                        <p>The overman...Who has organized the chaos of his passions, given style to his character, and become creative. Aware of life's terrors, he affirms life without resentment.
                        </p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div>
                        <img src="http://lorempixel.com/200/200/business/6/" alt="Texto Alternativo" class="img-circle img-thumbnail">
                        <h2>Software developer</h2>
                        <p>The overman...Who has organized the chaos of his passions, given style to his character, and become creative. Aware of life's terrors, he affirms life without resentment.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- /container -->





<section id="help">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-2">
                <h3>You need help?</h3>
                <br>
                <p>Are you having difficulties with the registration? <br> You saw an unknown status of the goods?.</p>
                <br>
                <button id="free_consult" data-toggle="modal"><a href="${contextPath}/application/faq">Read F.A.Q.</a></button>
            </div>
            <div class="col-md-2">
                <img src="${contextPath}/webresources/static/need/img/help_img.jpg" alt="Бесплатная консультация" class="img-responsive help_img center-block">
            </div>
        </div>
    </div>
</section>

<section id="portfolio">
    <div class="container">
        <div class="row">
            <div class="section_header text-center">
                <h2>Look at our portfolio</h2>
            </div>
        </div>
        <div class="col-md-10 col-md-offset-1">
            <div class="slider">
                <div class="fotorama"
                     data-nav="thumbs">
                    <img src="${contextPath}/webresources/static/need/img/portfolio/1.jpg" alt="">
                    <img src="${contextPath}/webresources/static/need/img/portfolio/2.jpg" alt="">
                    <img src="${contextPath}/webresources/static/need/img/portfolio/3.jpg" alt="">
                    <img src="${contextPath}/webresources/static/need/img/portfolio/4.jpg" alt="">
                    <img src="${contextPath}/webresources/static/need/img/portfolio/5.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
</section>

<section id="offer">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <img src="${contextPath}/webresources/static/need/img/gift.jpg" alt="Подарок" class="img-responsive center-block gift">
            </div>
            <div class="col-md-9">
                <h4>Offer</h4>
                <br>
                <h3>Our logistics experts will contact you. And answer all your questions.</h3>
                <p>It's free!</p>
                <div class="row">
                    <div class="col-md-4">
                        <form action="${contextPath}/webresources/static/need/send.php" method="post">
                            <input type="hidden" name="what" value="Участвовать в акции">
                            <input name="name" type="text" required placeholder="Имя" class="form-comtrol form_input">

                    </div>
                    <div class="col-md-4">
                        <input name="phone" id="phone_1" type="text" required placeholder="Телефон" class="form-comtrol form_input">
                    </div>
                    <div class="col-md-4">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <button type="submit">Send</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section id="feedback">
    <div class="container">
        <div class="row">
            <div class="section_header text-center">
                <h2>Feedback</h2>
            </div>
        </div>
        <div class="row">
            <div class="feedback_slider">
                <!-- Карусель -->
                <div id="myCarousel" class="carousel slide" data-interval="3000" data-ride="carousel">
                    <!-- Индикаторы для карусели -->
                    <ol class="carousel-indicators">
                        <!-- Перейти к 0 слайду карусели с помощью соответствующего индекса data-slide-to="0" -->
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <!-- Перейти к 1 слайду карусели с помощью соответствующего индекса data-slide-to="1" -->
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <!-- Перейти к 2 слайду карусели с помощью соответствующего индекса data-slide-to="2" -->
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>
                    <!-- Слайды карусели -->
                    <div class="carousel-inner">
                        <!-- Слайды создаются с помощью контейнера с классом item, внутри которого помещается содержимое слайда -->
                        <div class="active item">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="fotorama">
                                        <img src="${contextPath}/webresources/static/need/img/feedback/1/1.jpg" alt="">
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <img src="${contextPath}/webresources/static/need/img/avatar-1.jpg" alt="" class="img-circle center-block">
                                        </div>
                                        <div class="col-md-10">
                                            <h5>Rick Astley</h5>
                                            <a href="#">facebook.com/RickAstley/</a>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="audio">
                                            <audio controls>
                                                <source src="${contextPath}/webresources/static/need/audio/1.mp3" type="audio/mpeg">
                                            </audio>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <p>Never gonna give you up, never gonna let you down. Never gonna run around and desert you. Never gonna make you cry, never gonna say goodbye. Never gonna tell a lie and hurt you.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Слайд №2 -->
                        <div class="item">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="fotorama">
                                        <img src="${contextPath}/webresources/static/need/img/feedback/1/1.jpg" alt="">
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <img src="${contextPath}/webresources/static/need/img/avatar-1.jpg" alt="" class="img-circle center-block">
                                        </div>
                                        <div class="col-md-10">
                                            <h5>Rick Astley</h5>
                                            <a href="#">facebook.com/RickAstley/</a>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="audio">
                                            <audio controls>
                                                <source src="${contextPath}/webresources/static/need/audio/1.mp3" type="audio/mpeg">
                                            </audio>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <p>Never gonna give you up, never gonna let you down. Never gonna run around and desert you. Never gonna make you cry, never gonna say goodbye. Never gonna tell a lie and hurt you.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Слайд №3 -->
                        <div class="item">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="fotorama">
                                        <img src="${contextPath}/webresources/static/need/img/feedback/1/1.jpg" alt="">
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <img src="${contextPath}/webresources/static/need/img/avatar-1.jpg" alt="" class="img-circle center-block">
                                        </div>
                                        <div class="col-md-10">
                                            <h5>Rick Astley</h5>
                                            <a href="#">facebook.com/RickAstley/</a>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="audio">
                                            <audio controls>
                                                <source src="${contextPath}/webresources/static/need/audio/1.mp3" type="audio/mpeg">
                                            </audio>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <p>Never gonna give you up, never gonna let you down. Never gonna run around and desert you. Never gonna make you cry, never gonna say goodbye. Never gonna tell a lie and hurt you.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    </a>
                </div>
            </div>
        </div>
    </div>
</section>

<footer id="contacts">
    <div class="container">
        <div class="row">
            <div class="col-md-5 col-md-offset-1">
                <div class="map">
                    <script type="text/javascript" charset="utf-8" async src="https://api-maps.yandex.ru/services/constructor/1.0/js/?sid=cjWBGMGSAcq7LmcocqBllpwmaXh7segR&amp;width=100%25&amp;height=330&amp;lang=ru_RU&amp;sourceType=constructor&amp;scroll=true"></script>
                </div>
            </div>
            <div class="col-md-6">
                <h2>Contact Information</h2>
                <div class="row">
                    <address>
                        <p id="address">
                            Address:
                        </p>
                        <p id="minck">
                            Minsk, st. Pritytskogo 28, office 1
                        </p>
                    </address>
                </div>
                <div class="row">
                    <div class="phone_footer">
                        <p id="phone_footer">
                            Phone:
                        </p>
                        <p id="numder">
                            (29) 4-8-15-16-23-42
                        </p>
                    </div>
                </div>
                <div class="row social">
                    <a class="social_icon" href=""><img src="${contextPath}/webresources/static/need/img/vk.png" alt="Vkontakte"></a>
                    <a class="social_icon" href=""><img src="${contextPath}/webresources/static/need/img/insta.png" alt="Instagram"></a>
 
                </div>
            </div>
        </div>
        <div class="row details_row">
            <div class="col-md-4 details">
                <h5>INC "Serious company" </h5>
            </div>
            <div class="col-md-4 policy">
                <h5>Privacy policy</h5>
                <p>
                    © Minsk 2016—2016
                </p>
            </div>
            <div class="col-md-4 lk">
                <h4>Website developed by:</h4>
                <a href="https://vk.com/id83881482">Vladislav</a>
            </div>
        </div>
    </div>
</footer>



<!-- Modal -->
<div class="modal fade" id="get_mes_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>

            </div>
            <div class="modal-body text-center">
                <div class="row">
                    <div class="header_modal">
                        <h4>не знаю, что тут будет</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Подробнее (1 услуга) -->
<div class="modal fade" id="more_one" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>

            </div>
        </div>
    </div>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${contextPath}/webresources/static/need/js/bootstrap.min.js"></script>
<script src="${contextPath}/webresources/static/need/js/jquery.nicescroll.min.js"></script>
<script src="${contextPath}/webresources/static/need/js/wow.min.js"></script>
<script>
    new WOW().init();
</script>
<script>
    var h_hght = 165; // высота шапки
    var h_mrg = 0;    // отступ когда шапка уже не видна

    $(function(){

        var elem = $('#top_nav');
        var top = $(this).scrollTop();

        if(top > h_hght){
            elem.css('top', h_mrg);
        }

        $(window).scroll(function(){
            top = $(this).scrollTop();

            if (top+h_mrg < h_hght) {
                elem.css('top', (h_hght-top));
            } else {
                elem.css('top', h_mrg);
            }
        });

    });
</script>
<link  href="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet"> <!-- 3 KB -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script> <!-- 16 KB -->
</div>
</body>
</html>