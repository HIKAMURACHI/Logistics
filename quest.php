<?php require 'menu.php'; ?>
<?php
$go =  0;
$host = "127.0.0.1";
$user = "root";
$pass = "";
$db = "sushi";
$link = mysqli_connect($host, $user, $pass, $db);
if (!$link) {
    echo 'error connect: ' . mysqli_connect_errno() . ', just error: ' . mysqli_connect_error();
    exit;
    }
$query1 ="SELECT cost_delivery FROM Orders, Worker WHERE `Worker`.`surname_w` = 'Никитин' AND `Orders`.`id_worker` = `Worker`.`id_worker` AND `Orders`.`date_order` = '2019-02-01';";
$query2 ="SELECT concat('Ул.', delivery_street, ',д.', delivery_house), `rayon`.`name`, date_order FROM Orders, rayon WHERE `rayon`.`name` = 'Первомайский' AND `Orders`.`id_rayon` = `rayon`.`ID_rayon` AND `Orders`.`date_order` = '2019-02-02';";
$query3 ="SELECT date_order, surname_w, Count(`Orders`.`id_worker`), SUM(weight) FROM worker, Orders, List_order, sushi WHERE `Orders`.`id_worker` = `worker`.`id_worker` AND `Orders`.`id_order` = `List_order`.`id_order` AND `List_order`.`id_sushi` = `sushi`.`id_sushi` GROUP BY `date_order` ORDER BY `surname_w`;";
$query4 ="SELECT CONCAT(`Client`.`name_c`, '.', LEFT(surname_c , 1), '.', LEFT(patronymic_c , 1)) FROM `Client` WHERE  `Client`.`id_client` not in (SELECT `Orders`.`id_client` FROM `Orders`) GROUP BY `surname_c`;";
$query5 ="SELECT name_ing, count(id_sushi) FROM composition, Ingredient WHERE id_ingr = id_ingredient GROUP BY id_ingr ORDER BY count(id_ingr) DESC LIMIT 3;";
$query6 ="SELECT CONCAT(`Client`.`name_c`, '.', LEFT(surname_c , 1), '.', LEFT(patronymic_c , 1)), `Payment`.`ammout` FROM Orders, Payment, `Client` WHERE `Orders`.`id_order` = `Payment`.`id_order` AND `Client`.`id_client` = `Orders`.`id_client` AND`Payment`.`ammout` = (SELECT MAX(ammout) FROM Payment);";
$query7 ="SELECT name_sushi, weight, price, (price/weight) FROM sushi ORDER BY (price/weight) LIMIT 1;";
$query8 ="SELECT COUNT(RIGHT (patronymic_c, 2)) FROM `Client` GROUP BY RIGHT (patronymic_c, 2);";
$query9 ="SELECT `Orders`.`id_order` FROM `Orders` WHERE  `Orders`.`id_order` NOT IN (SELECT `Payment`.`id_order` FROM `Orders`, `Payment` WHERE `Payment`.`id_order` = `Orders`.`id_order`);";
$query10 ="SELECT name_sushi, weight, price*0.9 FROM sushi WHERE  id_sushi NOT IN (SELECT List_order.id_sushi FROM sushi, List_order WHERE sushi.id_sushi = List_order.id_sushi);";
$result1 = mysqli_query($link, $query1); 
$result2 = mysqli_query($link, $query2); 
$result3 = mysqli_query($link, $query3); 
$result4 = mysqli_query($link, $query4); 
$result5 = mysqli_query($link, $query5); 
$result6 = mysqli_query($link, $query6); 
$result7 = mysqli_query($link, $query7); 
$result8 = mysqli_query($link, $query8); 
$result9 = mysqli_query($link, $query9); 
$result10 = mysqli_query($link, $query10); 
if($result1)
{        
    $rows = mysqli_num_rows($result1);
    $fields = mysqli_num_fields($result1);
    
    echo "<style>
    div.relative {position: relative; width: 400px; height: 200px; border: 0px solid #73AD21; left: 60px;}
    table {color: black; background: #ffffff; left: 60px;} 
    td, th {padding: 5px; border: 0px solid #000000; left: 60px; font: 12pt/10pt sans-serif;} 
    tr:nth-child(even) {background-color: #f2f2f2;}
    </style>";
    echo '<div class="relative">';
    echo "<table><tr><th>Сумма нналичных</th></th></tr>"; //<th>Id</th><th>Фамилия</th><th>Имя</th><th>Отчество</th><th>Дата рождения</th><th>Номер телефона
    for ($i = 0 ; $i < $rows ; ++$i)
    {    
        $row = mysqli_fetch_row($result1);
        echo "<tr>";
            for ($j = 0 ; $j < $fields ; ++$j) echo "<td>$row[$j]</td>";            
        echo "</tr>";
    }
    echo "</table>";                     
    echo "<br/>";
}

if ($result2)
{
    $rows = mysqli_num_rows($result2);
    $fields = mysqli_num_fields($result2);

    echo "<table><tr><th>Адрес</th><th>Район</th><th>Дата заказа</th></th></tr>"; //<th>Id</th><th>Фамилия</th><th>Имя</th><th>Отчество</th><th>Дата рождения</th><th>Номер телефона
    for ($i = 0 ; $i < $rows ; ++$i)
    {    
        $row = mysqli_fetch_row($result2);
        echo "<tr>";
            for ($j = 0 ; $j < $fields ; ++$j) echo "<td>$row[$j]</td>";            
        echo "</tr>";
    }
    echo "</table>";                     
    echo "<br/>";
}

if ($result3)
{
    $rows = mysqli_num_rows($result3);
    $fields = mysqli_num_fields($result3);

    echo "<table><tr><th>Дата заказа</th><th>Курьер</th><th>Колличество заказов</th><th>Общий вес доставки</th></th></tr>"; //<th>Id</th><th>Фамилия</th><th>Имя</th><th>Отчество</th><th>Дата рождения</th><th>Номер телефона
    for ($i = 0 ; $i < $rows ; ++$i)
    {    
        $row = mysqli_fetch_row($result3);
        echo "<tr>";
            for ($j = 0 ; $j < $fields ; ++$j) echo "<td>$row[$j]</td>";            
        echo "</tr>";
    }
    echo "</table>";                     
    echo "<br/>";
}

if ($result4)
{
    $rows = mysqli_num_rows($result4);
    $fields = mysqli_num_fields($result4);

    echo "<table><tr><th>Клиенты без заказа</th></th></tr>"; //<th>Id</th><th>Фамилия</th><th>Имя</th><th>Отчество</th><th>Дата рождения</th><th>Номер телефона
    for ($i = 0 ; $i < $rows ; ++$i)
    {    
        $row = mysqli_fetch_row($result4);
        echo "<tr>";
            for ($j = 0 ; $j < $fields ; ++$j) echo "<td>$row[$j]</td>";            
        echo "</tr>";
    }
    echo "</table>";                     
    echo "<br/>";
}

if ($result5)
{
    $rows = mysqli_num_rows($result5);
    $fields = mysqli_num_fields($result5);

    echo "<table><tr><th>Наименование ингредиента</th><th>Количество суши</th></th></tr>"; //<th>Id</th><th>Фамилия</th><th>Имя</th><th>Отчество</th><th>Дата рождения</th><th>Номер телефона
    for ($i = 0 ; $i < $rows ; ++$i)
    {    
        $row = mysqli_fetch_row($result5);
        echo "<tr>";
            for ($j = 0 ; $j < $fields ; ++$j) echo "<td>$row[$j]</td>";            
        echo "</tr>";
    }
    echo "</table>";                     
    echo "<br/>";
}

if ($result6)
{
    $rows = mysqli_num_rows($result6);
    $fields = mysqli_num_fields($result6);

    echo "<table><tr><th>ФИО клиента</th><th>Сумма заказа</th></th></tr>"; //<th>Id</th><th>Фамилия</th><th>Имя</th><th>Отчество</th><th>Дата рождения</th><th>Номер телефона
    for ($i = 0 ; $i < $rows ; ++$i)
    {    
        $row = mysqli_fetch_row($result6);
        echo "<tr>";
            for ($j = 0 ; $j < $fields ; ++$j) echo "<td>$row[$j]</td>";            
        echo "</tr>";
    }
    echo "</table>";                     
    echo "<br/>";
}

if ($result7)
{
    $rows = mysqli_num_rows($result7);
    $fields = mysqli_num_fields($result7);

    echo "<table><tr><th>Название суши</th><th>Вес</th><th>Цена</th><th>Средня цена за грамм</th></th></tr>"; //<th>Id</th><th>Фамилия</th><th>Имя</th><th>Отчество</th><th>Дата рождения</th><th>Номер телефона
    for ($i = 0 ; $i < $rows ; ++$i)
    {    
        $row = mysqli_fetch_row($result7);
        echo "<tr>";
            for ($j = 0 ; $j < $fields ; ++$j) echo "<td>$row[$j]</td>";            
        echo "</tr>";
    }
    echo "</table>";                     
    echo "<br/>";
}

if ($result8)
{
    $row = mysqli_fetch_row($result8);
    echo "<table><tr><th>Пол</th><th>Колличество</th></th></tr>"; //<th>Id</th><th>Фамилия</th><th>Имя</th><th>Отчество</th><th>Дата рождения</th><th>Номер телефона           
        echo "<tr>";            
            echo "<td>мужчины</td>"; echo "<td>$row[0]</td>";   
        echo "</tr>";
        $row = mysqli_fetch_row($result8);
        echo "<tr>";            
            echo "<td>женщины</td>"; echo "<td>$row[0]</td>";   
        echo "</tr>";    
    echo "</table>";                     
    echo "<br/>";
}

if ($result9)
{
    $rows = mysqli_num_rows($result9);
    $fields = mysqli_num_fields($result9);

    echo "<table><tr><th>Нмера заказов</th></th></tr>"; //<th>Id</th><th>Фамилия</th><th>Имя</th><th>Отчество</th><th>Дата рождения</th><th>Номер телефона
    for ($i = 0 ; $i < $rows ; ++$i)
    {    
        $row = mysqli_fetch_row($result9);
        echo "<tr>";
            for ($j = 0 ; $j < $fields ; ++$j) echo "<td>$row[$j]</td>";            
        echo "</tr>";
    }
    echo "</table>";                     
    echo "<br/>";
}

if ($result10)
{
    $rows = mysqli_num_rows($result10);
    $fields = mysqli_num_fields($result10);

    echo "<table><tr><th>Наименование</th><th>Вес</th><th>Цена</th></tr>"; //<th>Id</th><th>Фамилия</th><th>Имя</th><th>Отчество</th><th>Дата рождения</th><th>Номер телефона
    for ($i = 0 ; $i < $rows ; ++$i)
    {    
        $row = mysqli_fetch_row($result10);
        echo "<tr>";
            for ($j = 0 ; $j < $fields ; ++$j) echo "<td>$row[$j]</td>";            
        echo "</tr>";
    }
    echo "</table>";                     
    echo "<br/>";
}

echo '</div>';
mysqli_close($link);
?>