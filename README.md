# InfBigData - Grupo 3
Este grupo está formado por: 
*  Pablo Alonso
*  Marcos Cedenilla
*  Matías Mussini
*  Antonio Reviejo

## Objetivo

En este README se describirán detadalladamente los pasos a seguir para poder proporcionar una infraestructura RDF para datos.gob.

## Pasos

Buscar cualquier conjunto de datos en datos.gob ( https://datos.gob.es ) que publique un archivo Turtle (.ttl) para permitir que sus usuarios puedan realizar consultas SPARQL desde su entorno local.

En nuestro caso escogimos los datos de estaciones y usos de bicis de la Estacion de Zaragoza (https://datos.gob.es/es/catalogo/l01502973-estaciones-y-usos-de-bizi-zaragoza) cuyo archivo contiene información sobre el estado de la estación, número de anclajes y número de bicicletas disponibles, entre otros.

1. Crear una imagen a partir de un dockerfile que herede de la imagen base ontotext/graphdb:10.1.5, que exponga el puerto 7200 y mediante el comando ADD descargaremos en la carpeta /root/graphdb-import/ los datos, **Importante** si los datos no estan directamente en ttl y están comprimidos se deberá añadir en el Dockerfile una instrucción mediante CMD o RUN para descomprimirlos.
   ```
   FROM ontotext/graphdb

   ADD [link de los datos] ./root/graphdb-import/

   EXPOSE 7200
   ```
2. Se ejecuta el comando ```docker build -t nombre_de_la_imagen:v ruta_dockerfile``` en la consola de la máquina.
 
3. Se ejecuta el comando ```docker run -d -p 7200:7200 --name nombre_del_contenedor nombre_de_la_imagen```.

5. Para acceder mediante el  navegador web al servicio debemos introducir en la barra de búsqueda 'localhost:7200'.  

6. Pulsamos en 'Create new repository' para crear un repositorio RDF, después escogemos la opción 'GraphDB repository'. En 'Repository ID*' se introduce el nombre 'Data'. 

7. Para importar los datos .ttl abrimos 'import RDF data', se pincha en 'server files' y en el archivo correspondiente se selecciona import. Se abrirá un panel con varias opciones donde seleccionamos import de nuevo.

8. Habiendo creado el repositorio, se ejecuta e comando ```docker commit nombre_del_contenedor nombre_nueva_imagen:v1```. V1 será el tag de la imagen. Se habrá creado una nueva imagen en el repositorio RDF.

9. Como queremos subirla en Docker hub, debemos iniciar sesión si no lo hemos hecho previamente. Para ello se ejecuta el comando ```docker login``` donde se nos pedirá introducir nuestro usuario y contraseña. Entramos en docker hub y creamos un repositorio con el mismo nombre que la nueva imagen. Una vez hemos iniciado sesión debemos ejecutar el comando ```docker image push nombre_nueva_imagen```.

10. Para comprobar que hemos realizado el proceso correctamente, ejecutamos una consulta en el apartado SPARQL dentro de GraphDB, en nuestro caso, hemos ejecutado la siguiente consulta: 
      ``` 
      select * where { 
               ?s ?p ?o .
            } limit 100
      ```
