<?php
echo '<link rel="stylesheet" type="text/css" href="css/select.css" />';
echo '<link rel="stylesheet" type="text/css" href="css/paralax.css" />';

$address = '127.0.0.1';
$user = 'root';
$password = '';
$database = 'Sushi';

$link = mysqli_connect($address, $user, $password, $database);
$adress = "SELECT concat(delivery_street, ',', delivery_house) FROM Orders ORDER BY concat(delivery_street, ',', delivery_house);";

if($link)
{        
    $address_result = mysqli_query($link, $adress);

    echo '<div class="wrapper">';
    echo '<div id="title">';
    echo '<form method =  "get"> <select name="street">';
    while ($myrow = mysqli_fetch_array($address_result)){
        printf ("<option value='%s'>%s</option>",$myrow["concat(delivery_street, ',', delivery_house)"], $myrow["concat(delivery_street, ',', delivery_house)"]);        
    }
    echo '</select>';
    
    echo '<input type="submit" value="Go"> </input>';    //onclick=location.href="#slide1"
    echo '</form>'; 
    echo '</div>';                  
}

$A_point = 'Россия, Удмуртская, Республиука, Ижевск, ул, Кирова, 140';
$B_point = 'Россия, Удмуртская, Республиука, Ижевск, ул,'.$_GET['street'];
?>