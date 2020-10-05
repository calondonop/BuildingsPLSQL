CREATE TABLE apartments(
apartment_id 	 NUMBER,
building_id 	 NUMBER,
apartment_number NUMBER,
CONSTRAINT pk_apartments PRIMARY KEY(apartment_id),
CONSTRAINT fk_apartments_buildings 
	FOREIGN KEY (building_id) 	
	REFERENCES "buildingadmin".buildings(building_id)
);