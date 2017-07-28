<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/webresources/common/header.jspf"%>


<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>АСУЗП</title>

    <!-- Bootstrap -->

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
                <img src="img/logo.png" alt="Логотип Компании" class="img-responsive">
            </div>
            <div class="col-sm-7 text-center descript">
                <h4>Автоматизированная система по управлению заказом пользователя</h4>
                <h5>АСУЗП</h5>
            </div>
            <div class="col-sm-3 phone_number">
                <h3><a href="+375298715105">(29) 4-8-15-16-23-42</a></h3>
                <p>Режим работы с 8<sup>30</sup> до 18<sup>00</sup></p>
            </div>
        </div>
    </div>
</header>

<nav>
    <div class="container">
        <div class="row">
            <ul class="list-inline">
                <a href="#">
                    <li>Главная</li>
                </a>
                <a href="#">
                    <li>Предоставляемое услуги</li>
                </a>
                <a href="#">
                    <li>Оборудование</li>
                </a>
                <a href="#">
                    <li>Акции</li>
                </a>
                <a href="#">
                    <li>Отзывы</li>
                </a>
                <a href="#">
                    <li>Контакты</li>
                </a>
            </ul>
        </div>
    </div>
</nav>

<section id="main">
    <div class="container">
        <div class="row main_header">
            <h1><span>Вы совершили большую ошибку обратившись к нам! <br>Я серьезно, бегите пока можете.</span></h1>
        </div>
        <div class="row">
            <h3>Вы сами на это пошли.<span> Зря-зря!</span></h3>
        </div>
        <div class="row main_buttons">
            <button data-toggle= "modal" id="get_mes" href=#">Я идиот.</button>
            <a href="#types"><button id="get_types">Меня заставили!</button></a>
        </div>
    </div>
</section>

<section id="types">
    <div class="container">
        <div class="row">
            <div class="section_header text-center">
                <h2> Услуги</h2>
            </div>
        </div>
        <div class="row text-center">
            <div class="col-md-3">
                <div class="card">
                    <img src="img/types-1.jpg" alt="Страдание" class="img-responsive center-block">
                    <h4>Страдание</h4>
                    <br>
                    <button class="more_btn" data-toggle="modal" href="#">Подробнее</button>
                    <button class="offer_btn" data-toggle="modal" href="#">Купить</button>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <img src="img/types-2.jpg" alt="Боль" class="img-responsive center-block">
                    <h4>Боль</h4>
                    <br>
                    <button class="more_btn" data-toggle="modal" href="#">Подробнее</button>
                    <button class="offer_btn" data-toggle="modal" href="#">Купить</button>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <img src="img/types-3.jpg" alt="Олишевко" class="img-responsive center-block">
                    <h4>Олишевко</h4>
                    <br>
                    <button class="more_btn" data-toggle="modal" href="#">Подробнее</button>
                    <button class="offer_btn" data-toggle="modal" href="#">Купить</button>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <img src="img/types-4.jpg" alt="Терроризм" class="img-responsive center-block">
                    <h4>Терроризм</h4>
                    <br>
                    <button class="more_btn" data-toggle="modal" href="#">Подробнее</button>
                    <button class="offer_btn" data-toggle="modal" href="#">Купить</button>
                </div>
            </div>
        </div>
    </div>
</section>

<section id="help">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-2">
                <h3>Нужна помощь в выборе?</h3>
                <br>
                <p>Оставте заявку на консультацию и наш специалист подробно ответит <br> на все интересующие Вас вопросы.Это бесплатно.</p>
                <br>
                <button id="free_consult" data-toggle="modal" href="#">Бесплатная консультация</button>
            </div>
            <div class="col-md-2">
                <img src="img/help_img.jpg" alt="Бесплатная консультация" class="img-responsive help_img center-block">
            </div>
        </div>
    </div>
</section>

<section id="portfolio">
    <div class="container">
        <div class="row">
            <div class="section_header text-center">
                <h2>Посмотрите как мы вас ненавидим</h2>
            </div>
        </div>
        <div class="col-md-8 col-md-offset-2">
            <div class="slider">
                <div class="fotorama"
                     data-nav="thumbs">
                    <img src="img/portfolio/1.jpg" alt="">
                    <img src="img/portfolio/2.jpg" alt="">
                    <img src="img/portfolio/3.jpg" alt="">
                    <img src="img/portfolio/4.jpg" alt="">
                    <img src="img/portfolio/5.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
</section>

<section id="offer">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <img src="img/gift.jpg" alt="Подарок" class="img-responsive center-block gift">
            </div>
            <div class="col-md-9">
                <h4>Акция</h4>
                <br>
                <h3>Подключите услугу "Максим заебал" до 16.12.2016</h3>
                <p>И получите в подарок Flugegeheimen!</p>
                <div class="row">
                    <div class="col-md-4">
                        <form action="#">
                            <input name="name" type="text" required placeholder="Имя" class="form-comtrol form_input">
                    </div>
                    <div class="col-md-4">
                        <input name="phone" type="text" required placeholder="Телефон" class="form-comtrol form_input">
                    </div>
                    <div class="col-md-4">
                        <button type="submit">Подключить</button>
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
                <h2>Отзывы</h2>
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
                                        <img src="img/feedback/1/1.jpg" alt="">
                                        <img src="img/feedback/1/2.jpg" alt="">
                                        <img src="img/feedback/1/3.jpg" alt="">
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <img src="img/avatar-1.jpg" alt="" class="img-circle center-block">
                                        </div>
                                        <div class="col-md-10">
                                            <h5>Rick Astley</h5>
                                            <a href="#">facebook.com/RickAstley/</a>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="audio">
                                            <audio controls>
                                                <source src="audio/1.mp3" type="audio/mpeg">
                                            </audio>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <p>Ребята сразу дадут тебе понять: что никогда тебя не покинут, никогда не унизят, никогда не убегут от тебя и никогда не бросят. Никогда не заставят плакать, никогда не скажут "Прощай", никогда не соврут и не сделают тебе больно.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Слайд №2 -->
                        <div class="item">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="fotorama">
                                        <img src="img/feedback/1/1.jpg" alt="">
                                        <img src="img/feedback/1/2.jpg" alt="">
                                        <img src="img/feedback/1/3.jpg" alt="">
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <img src="img/avatar-1.jpg" alt="" class="img-circle center-block">
                                        </div>
                                        <div class="col-md-10">
                                            <h5>Rick Astley</h5>
                                            <a href="#">facebook.com/RickAstley/</a>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="audio">
                                            <audio controls>
                                                <source src="audio/1.mp3" type="audio/mpeg">
                                            </audio>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <p>Ребята сразу дадут тебе понять: что никогда тебя не покинут, никогда не унизят, никогда не убегут от тебя и никогда не бросят. Никогда не заставят плакать, никогда не скажут "Прощай", никогда не соврут и не сделают тебе больно.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Слайд №3 -->
                        <div class="item">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="fotorama">
                                        <img src="img/feedback/1/1.jpg" alt="">
                                        <img src="img/feedback/1/2.jpg" alt="">
                                        <img src="img/feedback/1/3.jpg" alt="">
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <img src="img/avatar-1.jpg" alt="" class="img-circle center-block">
                                        </div>
                                        <div class="col-md-10">
                                            <h5>Rick Astley</h5>
                                            <a href="#">facebook.com/RickAstley/</a>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="audio">
                                            <audio controls>
                                                <source src="audio/1.mp3" type="audio/mpeg">
                                            </audio>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <p>Ребята сразу дадут тебе понять: что никогда тебя не покинут, никогда не унизят, никогда не убегут от тебя и никогда не бросят. Никогда не заставят плакать, никогда не скажут "Прощай", никогда не соврут и не сделают тебе больно.</p>
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
                <h2>Контактные данные</h2>
                <div class="row">
                    <address>
                        <p id="address">
                            Адрес:
                        </p>
                        <p id="minck">
                            Минск, ул. Притыцкого 28, офис 1
                        </p>
                    </address>
                </div>
                <div class="row">
                    <div class="phone_footer">
                        <p id="phone_footer">
                            Телефон:
                        </p>
                        <p id="numder">
                            (29) 4-8-15-16-23-42
                        </p>
                    </div>
                </div>
                <div class="row social">
                    <a class="social_icon" href=""><img src="img/vk.png" alt="Вконтакте"></a>
                    <a class="social_icon" href=""><img src="img/insta.png" alt="Инстаграм"></a>
                    <button id="get_answer" data-toggle="modal" href="#">Задать вопрос</button>
                </div>
            </div>
        </div>
        <div class="row details_row">
            <div class="col-md-4 details">
                <h5>ООО "Серьёзная компания" </h5>
            </div>
            <div class="col-md-4 policy">
                <h5>Плитика конфиденциальности</h5>
                <p>
                    © Минск 2016—2016
                </p>
            </div>
            <div class="col-md-4 lk">
                <h4>Сайт разработан:</h4>
                <a href="https://vk.com/id83881482">Владислав</a>
                <a href="https://vk.com/maxvancom"> & Максим</a>
            </div>
        </div>
    </div>
</footer>



<!-- Modal -->
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>

            </div>
            <div class="modal-body">
                <div class="row">

                </div>
            </div>
        </div>
    </div>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.nicescroll.min.js"></script>
<script src="js/wow.min.js"></script>
<script>
    new WOW().init();
</script>
<script>
    $(document).ready(
            function() {
                $("html").niceScroll({cursorcolor:"#000"});
            }
    );
</script>

<link  href="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet"> <!-- 3 KB -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script> <!-- 16 KB -->

</body>
</html>

<%--end content--%>
<%@ include file="/webresources/common/footer.jspf"%>
