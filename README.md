# BuildingsPLSQL

Se tiene el archivo export.sql, allí se encuentra las dos tablas, con sus insert y la función creada.

Sin embargo también se suben los scripts de cada elemento, los dos scripts de las tablas, los insert para cada una de las tablas y el script de la función creada que retorna los result set.

En caso de correr los scripts de manera independiente tener en cuenta el orden que debe ser:

1. create_table_buildings.sql
2. create_table_apartments.sql
3. insert_into_buildings.sql
4. insert_into_apartments.sql
5. fn_querybuildings.sql
