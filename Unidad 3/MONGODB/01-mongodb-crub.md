# MongoDB Crud

## Crear una base de datos 

**Solo se crea si contiene por lo menos una coleccion**
```json
use  basededatos
```

## crear una collecion

`use bd1

db.createCollection ('Empleado')`

## Mostarar Coleciones 

`show collections`

## Insercion de un docuemnto
db.Empleado.insertOne (

{
    nombre:'Soyla',
    apellido:'Vaca',
    edad:32,
    ciudad:'San Miguel de las piedras'
}
)