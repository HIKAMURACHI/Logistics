<?php require 'menu.php'; ?>
<?php require 'ingredients.php'; ?>

<!DOCTYPE html>
<html>
    <head>        
        <link href="css/paralax.css" rel="stylesheet">        
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
    <script src=ingredients.php></script>  
    <script src="https://api-maps.yandex.ru/2.1/?lang=ru_RU&amp;apikey=<9db93436-22b8-432f-b73e-7a0da937bd56>" type="text/javascript"></script>
    <script type="text/javascript">        

        var A_point = '<?php echo $A_point;?>';
        var B_point = '<?php echo $B_point;?>';

        function init () {
            /**             
             * @see https://api.yandex.ru/maps/doc/jsapi/2.1/ref/reference/multiRouter.MultiRoute.xml
             * @see https://api.yandex.ru/maps/doc/jsapi/2.1/ref/reference/multiRouter.MultiRouteModel.xml
             */
            var multiRoute = new ymaps.multiRouter.MultiRoute({                
                referencePoints: [
                    A_point,
                    B_point
                ],                
                params: {                    
                    results: 2
                }
            }, {                
                boundsAutoApply: true
            });                                
            var myMap = new ymaps.Map('map', {
                center: [55.750625, 37.626],
                zoom: 7,
                controls: []
            }, {
                buttonMaxWidth: 300
            });         
            myMap.geoObjects.add(multiRoute);
        }
        ymaps.ready(init);
    </script>
	<style>
        #map {
            width: 100%; height: 100%; padding: 0; margin: 0; float:inherit;
        }
        /*html, body {
            width: 100%; height: 100%; padding: 0; margin: 0; float:right;
        }*/       
    </style>
    </head>    
 <body>        
 <div id="map"></div>                      
    </body>
</html>