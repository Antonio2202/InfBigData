# InfBigData - Grupo 3
Este grupo está formado por: 
*  Pablo Alonso
*  Marcos Cedenilla
*  Matías Mussini
*  Antonio Reviejo

## Objetivo

En este README se describirán detadalladamente los pasos a seguir para poder proporcionar una infraestructura RDF para datos.gob, 

## Pasos

1. Buscar cualquier conjunto de datos en datos.gob ( https://datos.gob.es ) que publique un archivo Turtle (.ttl) para permitir que sus usuarios puedan realizar consultas SPARQL desde su entorno local.

En nuestro caso escogimos los datos de estaciones y usos de bicis de la Estacion de Zaragoza (https://datos.gob.es/es/catalogo/l01502973-estaciones-y-usos-de-bizi-zaragoza) cuyo archivo contiene información sobre el estado de la estación, número de anclajes y número de bicicletas disponibles, entre otros.

2. Crear una imagen a partir de un dockerfile que herede de la imagen base ontotext/graphdb:10.1.5, que exponga el puerto 7200 y mediante el comando ADD descargaremos en la carpeta /root/graphdb-import/ los datos, **Importante** si los datos no estan directamente en ttl y están comprimidos se deberá añadir en el Dockerfile una instrucción mediante CMD o RUN para descomprimirlos.
3. Se ejecuta el comando ```docker build -t nombre_de_la_imagen:v ruta_dockerfile``` en la consola de la máquina.
