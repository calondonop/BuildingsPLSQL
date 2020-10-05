CREATE OR REPLACE FUNCTION queryBuildings(queryType IN NUMBER, 
										  dinamicWhere IN VARCHAR2 DEFAULT NULL)
RETURN SYS_REFCURSOR
IS
  resultSet SYS_REFCURSOR;
  query     VARCHAR2(2000);
BEGIN
  IF queryType = 1 THEN
    query:= 'SELECT *
               FROM buildings
              WHERE building_id = ' || dinamicWhere;
  ELSIF queryType = 2 THEN
    query:= 'SELECT name, apartment_number
               FROM buildings
               INNER JOIN apartments
               ON buildings.building_id = apartments.building_id
              WHERE buildings.building_id IN (' || dinamicWhere ||')';
  ELSIF queryType = 3 THEN
    query:= 'SELECT *
               FROM buildings
              WHERE building_id NOT IN(SELECT building_id
                             FROM apartments)';
  END IF;
  OPEN resultSet FOR query;
  RETURN resultSet;
END queryBuildings;