\# ETL MongoDB → NiFi → PostgreSQL



Pipeline de datos que extrae GiftCard orders desde MongoDB, las transforma y las carga en PostgreSQL usando Apache NiFi.



\## Stack

\- Apache NiFi 2.1.0

\- MongoDB 7

\- PostgreSQL 16

\- Docker



\## Arquitectura

GenerateFlowFile → UpdateAttribute → GetMongo → UpdateRecord → PutDatabaseRecord



\## Cómo ejecutarlo



1\. Levantar el stack

docker compose up -d



2\. Cargar data de prueba en MongoDB

docker exec -it nifi-lab-mongodb-1 mongosh

use giftcard\_lab

db.GiftCardOrder.insertMany(contenido de data/giftcard\_sample.json)



3\. Crear tabla en PostgreSQL

docker exec -it nifi-lab-postgres-1 psql -U postgres -d nifi\_lab

Ejecutar el script sql/create\_tables.sql



4\. Importar el flow en NiFi

Entrar a https://localhost:8443/nifi

Usuario: admin / Contraseña: admin12345678

Importar flows/GiftCard\_ETL.json



\## Estructura del proyecto

nifi-lab/

├── README.md

├── docker-compose.yml

├── data/

│   └── giftcard\_sample.json

├── flows/

│   └── GiftCard\_ETL.json

└── sql/

&#x20;   └── create\_tables.sql



\## Lo que hace el flow

\- GenerateFlowFile → dispara el pipeline

\- UpdateAttribute → calcula rango de fechas con Expression Language

\- GetMongo → consulta colección GiftCardOrder

\- UpdateRecord → convierte createdTime de string ISO a TIMESTAMP

\- PutDatabaseRecord → inserta en PostgreSQL



\## Aprendizajes

\- ETL con Apache NiFi 2.1.0

\- Conexión NiFi → MongoDB con MongoDBControllerService

\- Conexión NiFi → PostgreSQL con DBCPConnectionPool

\- Transformación de tipos de datos con UpdateRecord

\- Expression Language de NiFi

\- Stack completo con Docker Compose

