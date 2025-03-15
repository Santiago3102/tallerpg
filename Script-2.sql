/*
 * 1. Insertar 2 registros en la tabla viewing donde los códigos de propiedades sean ‘PF01’ y ‘PF02’
 * y los demás datos que ustedes quieran.
 */

insert into viewing (clientno, propertyno, viewdate, "comment")
       values ('CR31', 'PF01', '22-Apr-06', 'Really beautiful');
       
insert into viewing (clientno, propertyno, viewdate, "comment")
       values ('CR22', 'PF02', '22-Apr-24', 'its amazing');

/*
 * 2. Insertar 2 registros en la tabla Lease donde los códigos de clientes sean ‘CL01’ y ‘CL02’ y los
 * demás datos que ustedes quieran.
 */

Insert into  lease  (leaseNo, propertyNo, clientNo, rent, paymentMethod, deposit, paid, rentStart, rentFinish, duration) 
       values ('22046', 'PF03', 'CL01', '500', 'visa', '900', 'Y', '21-sep-24', '31-oct-25', 13);
       
Insert into lease  (leaseNo, propertyNo, clientNo, rent, paymentMethod, deposit, paid, rentStart, rentFinish, duration) 
       values ('31103', 'PF04', 'CL02', '800', 'cash', '1200', 'Y', '23-sep-24', '31-dec-25', 15);
  
/*
 * 3. Insertar 2 registros en la tabla Staff donde los códigos de sucursales sean ‘SU01’ y ‘SU02’ y los
 * demás datos que ustedes quieran.
 */

insert into staff (staffNo, fName, lName, position, sex, DOB, salary, branchNo)
       values ('SU01', 'Laura', 'Castaño', 'Manager', 'F', '22-Apr-06', '30000', 'B005');
       
insert into staff (staffNo, fName, lName, position, sex, DOB, salary, branchNo)
       values ('SU02', 'Camilo', 'Ramirez', 'Assistant', 'M', '31-Oct-02', '12000', 'B005');

/*
 * 4. Insertar 2 registros en la tabla PropertyForRent donde los códigos de Dueños sean ‘DU01’ y
 * ‘DU02’ y los demás datos que ustedes quieran.
 */

insert into propertyforrent (propertyNo, street, city, postcode, type, rooms, rent, ownerNo, staffNo, branchNo)
       Values ('PA22', '16 Manor Rd', 'London', 'NW2', 'House', 6, 850, 'DU01', 'SU01', 'B005');

insert into propertyforrent (propertyNo, street, city, postcode, type, rooms, rent, ownerNo, staffNo, branchNo)
       Values ('PA31', '17 Manor Rd', 'London', 'NW2', 'flat', 3, 650, 'DU02', 'SU02', 'B005');

/*
 * Las inserciones a continuación son las necesarias para poder crear las llaves foraneas
 * de las tablas que no permitian por falta de datos en las tablas padres.
 */

insert into propertyforrent (propertyNo, street, city, postcode, type, rooms, rent, ownerNo, staffNo, branchNo)
       Values ('PF03', '19 Manor Rl', 'London', 'NW2', 'flat', 3, 650, 'DU02', 'SU02', 'B005');

insert into propertyforrent (propertyNo, street, city, postcode, type, rooms, rent, ownerNo, staffNo, branchNo)
       Values ('PF04', '19 Manor Rl', 'London', 'NW2', 'house', 7, 1050, 'DU02', 'SU02', 'B005');

insert  into  Client(clientNo,fName,lName,telNo, prefType,maxRent)
	   values('CL01','Sara','Kay','0207-774-2231','Flat',725);

insert  into  Client(clientNo,fName,lName,telNo, prefType,maxRent)
	   values('CL02','Tatiana','Castle','0207-073-2231','house',1125);

insert  into  Client(clientNo,fName,lName,telNo, prefType,maxRent)
	   values('CR31','Leur','Grand','0602-073-2231','house',1225);

insert  into  Client(clientNo,fName,lName,telNo, prefType,maxRent)
	   values('CR22','Tiag','Mer','0602-209-2231','flat',725);

insert into propertyforrent (propertyNo, street, city, postcode, type, rooms, rent, ownerNo, staffNo, branchNo)
       Values ('PF01', '19 Manson l', 'Manchester', 'NW2', 'flat', 4, 850, 'DU02', 'SU02', 'B005');

insert into propertyforrent (propertyNo, street, city, postcode, type, rooms, rent, ownerNo, staffNo, branchNo)
       Values ('PF02', '22 Northon G', 'York', 'NW2', 'house', 5, 1000, 'DU02', 'SU02', 'B005');

/*
 * 5. Ejecutar la siguiente sentencia:
 * Commit;
 */

commit;   
       