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
    <title>F.A.Q. </title>

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

    <nav id="top_nav">
      <div class="container">
        <div class="row">
          <ul class="list-inline">
            <a href="${contextPath}/">
              <li>Главная</li>
            </a>
          </ul>
        </div>
      </div>
    </nav>

      

  <section id="faq">
  <div class="container">
  <div class="page-header">
    <li style="margin-top: 35px" >
    <h1 id="timeline">F.A.Q.</h1>
  </div>
  <ul class="timeline">
    <li>
      <div class="timeline-badge"><i class="glyphicon glyphicon-check"></i></div>
      <div class="timeline-panel">
        <div class="timeline-heading">
          <h4 class="timeline-title">Registration</h4>
          <p><small class="text-muted"><i class="glyphicon glyphicon-time"></i> 11 hours ago via Twitter</small></p>
        </div>
        <div class="timeline-body">
          <p>1.Get a square piece of paper. This paper rose starts with a simple square, as most origami projects do. Choose any color you'd like, so long as the two sides are different in color or texture. Glossy paper makes for the most realistic-looking rose.</p>
          <p>2.Fold the paper in half (Start with the colored side down, white side up). Bring the bottom edge of the paper up to meet the top edge. Crease the fold with your fingers, working from the center outwards.
          </p>
          <p>3.Unfold the paper. When you open the fold, you'll see the crease you've made running right through the middle of the paper, creating a horizontal line.</p>
          <p>4.Fold the bottom half in half. Line up the bottom edge of the paper to meet the horizontal crease in the middle.</p>
          <p>5.Fold the top half in half. Bring the top edge of the paper to meet the lower horizontal crease.</p>
        </div>
      </div>
    </li>
    <li class="timeline-inverted">
      <div class="timeline-badge warning"><i class="glyphicon glyphicon-credit-card"></i></div>
      <div class="timeline-panel">
        <div class="timeline-heading">
          <h4 class="timeline-title">Unknown status</h4>
        </div>
        <div class="timeline-body">
          <p>Open- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  </p>
          <p>Wait- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . </p>
          <p>Ordered-. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . </p>
          <p>Canceled- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . </p>
        </div>
      </div>
    </li>
    <li>
      <div class="timeline-badge danger"><i class="glyphicon glyphicon-credit-card"></i></div>
      <div class="timeline-panel">
        <div class="timeline-heading">
          <h4 class="timeline-title">How to pay?</h4>
        </div>
        <div class="timeline-body">
          <p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo.
            Manduma pindureta quium dia nois paga. Sapien in monti palavris qui num significa nadis i pareci latim. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.</p>
        </div>
      </div>
    </li>
    <li class="timeline-inverted">
      <div class="timeline-panel">
        <div class="timeline-heading">
          <h4 class="timeline-title">Bla-bla-bla</h4>
        </div>
        <div class="timeline-body">
          <p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo.
            Manduma pindureta quium dia nois paga. Sapien in monti palavris qui num significa nadis i pareci latim. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.</p>
        </div>
      </div>
    </li>
    <li>
      <div class="timeline-badge info"><i class="glyphicon glyphicon-floppy-disk"></i></div>
      <div class="timeline-panel">
        <div class="timeline-heading">
          <h4 class="timeline-title">Bla-bla-bla</h4>
        </div>
        <div class="timeline-body">
          <p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo.
            Manduma pindureta quium dia nois paga. Sapien in monti palavris qui num significa nadis i pareci latim. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.</p>
          <hr>
        </div>
      </div>
    </li>
    <li>
      <div class="timeline-panel">
        <div class="timeline-heading">
          <h4 class="timeline-title">Bla-bla-bla</h4>
        </div>
        <div class="timeline-body">
          <p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo.
            Manduma pindureta quium dia nois paga. Sapien in monti palavris qui num significa nadis i pareci latim. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.</p>
        </div>
      </div>
    </li>
    <li class="timeline-inverted">
      <div class="timeline-badge success"><i class="glyphicon glyphicon-thumbs-up"></i></div>
      <div class="timeline-panel">
        <div class="timeline-heading">
          <h4 class="timeline-title">Bla-bla-bla</h4>
        </div>
        <div class="timeline-body">
          <p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo.
            Manduma pindureta quium dia nois paga. Sapien in monti palavris qui num significa nadis i pareci latim. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.</p>
        </div>
      </div>
    </li>
  </ul>
</div>
</section>
    

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
  </body>
</html>