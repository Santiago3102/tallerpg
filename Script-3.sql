/*
 * 6. Crear las llaves primarias de cada tabla. Buscar por internet como se hace y documentar como
 * se hace y su propósito. Si existe un error corregirlo y explicar cómo lo soluciono.
 */

alter table branch add constraint pk_branch primary key(branchno);

alter table lease add constraint pk_lease primary key(leaseno);

alter table staff add constraint pk_staff primary key(staffno);

alter table client add constraint pk_client primary key(clientno);

alter table propertyforrent  add constraint pk_propertyfrent primary key(propertyno);

alter table privateowner  add constraint pk_owner primary key(ownerno);

alter table viewing  add constraint pk_viewing primary key(clientno, propertyno, viewdate);

alter table registration add constraint pk_registration primary key(clientno, branchno, staffno);

/*
 * 7. Crear las llaves foráneas de cada tabla. Buscar por internet como se hace y documentar como
 * se hace y su propósito. Si existe un error corregirlo y explicar cómo lo soluciono.
 */

alter table propertyforrent add constraint fk_property_branch 
foreign key (branchno) references branch(branchno);

alter table propertyforrent add constraint fk_property_staff 
foreign key (staffno) references staff(staffno);

alter table staff add constraint fk_staff_branch 
foreign key (branchno) references branch(branchno);

alter table registration  add constraint fk_registration_client 
foreign key (clientno) references client(clientno);

alter table registration  add constraint fk_registration_branch 
foreign key (branchno) references branch(branchno);

alter table registration  add constraint fk_registration_staff
foreign key (staffno) references staff(staffno);

alter table lease add constraint fk_lease_property
foreign key (propertyno) references propertyforrent(propertyno);

alter table lease add constraint fk_lease_client
foreign key (clientno) references client(clientno);

alter table viewing add constraint fk_viewing_client
foreign key (clientno) references client(clientno);

alter table viewing add constraint fk_viewing_property
foreign key (propertyno) references propertyforrent(propertyno);

/*
 * Se generaron errores ya que en las tables padres no existian cierta informacion que se insertó en las tablas hijas,
 * en mi caso decidi crear nuevas tuplas con estos datos y asi completar la información, pero de ser otro caso, también podía
 * optar por eliminar esos datos que no lograban relacionarse con las tablas. Para ser mas exactos esto sucedió con las 4 últimas
 * llaves foraneas creadas
 */


/*
 8. Consecuencias de insertar con FK activas
Si los puntos 1 al 4 se realizaran con las llaves foráneas activas, ocurriría lo siguiente:

Las inserciones fallarían si las claves referenciadas no existen previamente en las tablas padre
Por ejemplo, al insertar en viewing con los códigos 'PF01' y 'PF02', estos deberían existir primero en la tabla PropertyForRent
Al insertar en Lease con clientes 'CL01' y 'CL02', estos deberían existir en la tabla Client
Al insertar en Staff con sucursales 'SU01' y 'SU02', estas deberían existir en la tabla Branch
Al insertar en PropertyForRent con dueños 'DU01' y 'DU02', estos deberían existir en la tabla PrivateOwner

En bases de datos con integridad referencial, el orden de inserción es crucial: primero las tablas padre y luego las tablas hijo.
 */
*/