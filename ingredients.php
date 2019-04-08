<?php
echo '<link rel="stylesheet" type="text/css" href="css/select.css" />';
echo '<link rel="stylesheet" type="text/css" href="css/paralax.css" />';

$address = '127.0.0.1';
$user = 'root';
$password = '';
$database = 'Sushi';

$link = mysqli_connect($address, $user, $password, $database);
$adress = "SELECT `name`, concat(country, ',', city, ',', street, ',', house) FROM Suppliers ORDER BY `name`;";

if($link)
{       
    $address_result = mysqli_query($link, $adress);

    echo '<div class="wrapper">';
    echo '<div id="title">';
    echo '<form method =  "get"> <select name="street">';
    while ($myrow = mysqli_fetch_array($address_result)){
        printf ("<option value='%s'>%s</option>",$myrow["concat(country, ',', city, ',', street, ',', house)"], $myrow["name"]);        
    }
    echo '</select>';
    
    echo '<input type="submit" value="Go"> </input>';    //onclick=location.href="#slide1"
    echo '</form>'; 
    echo '</div>';                  
}

$A_point = $_GET['street'];
$B_point = 'Россия, Удмуртская, Республиука, Ижевск, ул, Кирова, 140';
?>