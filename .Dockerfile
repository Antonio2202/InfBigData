FROM ontotext/graphdb:10.1.5

ADD https://datos.gob.es/es/catalogo/l01502973-estaciones-y-usos-de-bizi-zaragoza.ttl /root/graphdb-import/

EXPOSE 7200
