<?php
//Принимаем постовые данные
$name=$_POST['name'];
$phone=$_POST['phone'];
$what=$_POST['what'];
//Указываем на какой ящик посылать письмо
$to = "valman1a1@gmail.com";
//Далее идет тема и само сообщение
$subject = "Заявка с сайта";
$message = "
Письмо отправленно из моей формы.<br />
Пользователь хочет: ".htmlspecialchars($what)."<br />
Имя: ".htmlspecialchars($name)."<br />
Телефон: ".htmlspecialchars($phone);
$headers = "From: mysite.com <site-email@mysite.com>\r\nContent-type: text/html;
		charset=UTF-8 \r\n";
mail ($to, $subject, $message, $headers);
header('Location: index.html');
exit();
?> 
 