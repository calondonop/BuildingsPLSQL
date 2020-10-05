# BuildingsPLSQL

Se tiene el archivo export.sql, allí se encuentra las dos tablas, con sus insert y la función creada.

Sin embargo también se suben los scripts de cada elemento, los dos scripts de las tablas, los insert para cada una de las tablas y el script de la función creada que retorna los result set.

En caso de correr los scripts de manera independiente tener en cuenta el orden que debe ser:

1. create_table_buildings.sql
2. create_table_apartments.sql
3. insert_into_buildings.sql
4. insert_into_apartments.sql
5. fn_querybuildings.sql

Para la ejecución y uso de la función querybuildings, se debe tener en cuenta que recibe dos parámetros:

1. El primero corresponde a la opción que la función ejecutara, acorde  a las solicitadas en el requerimiento, por lo tanto se puede ingresar 1, 2 ó 3:
  1. Toda la información de un edificio a partir del id
  2. Nombre del edificio y número del apartamento para varios edificios dependiendo de los ids recibidos por parámetros.
  3. Todos los edificios sin apartamentos relacionados.

2. El otro parámetro son los id de building que se deben ingresar, son los parámetros para el query que se vaya a ejecutar, según la opción que se haya seleccionado, por ejemplo, para la opción 1, se puede enviar el id del building 1, para el caso de la opción 2, que sería necesario ingresar varios id de building sería 1,2 y para la opción 3 no es necesario ingresar nada para este parámetro.

Ejemplos de llamado de la función:

- querybuilding(1, '1');
- querybuilding(2, '1,2');
- querybuilding(3); 
