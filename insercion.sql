

-- ### NOTA IMPORTANTE: para las tablas "usado_en", y "stock" se utilizo la inserción masiva explicada en calses, se agregan archivos csv en carpeta. 


use chaco_print;

/* PERTENECE AL SEGMENTO IDENTIFICACION DE EQUIPO */

INSERT INTO marca (nombre_marca) 
VALUES
('BROTHER'),
('EPSON'),
('HEWLETT_PACKARD'),
('LEXMARK'),
('RICOH');

INSERT INTO modelo (nombre_modelo,id_marca,fotocopia,imprime,escanea,monocromo,color,cantidad)
VALUES
('MP 2001',5,'si','no','no','si','no',10),
('AFICIO MP 301SPF',5,'si','si','si','si','no',10),
('AFICIO SP8300 DN',5,'no','si','no','si','no',5),
('HP 408 DN',3,'no','si','no','si','no',20),
('DCP 8060',1,'si','si','si','si','no',15),
('x464 ex',4,'si','si','si','si','no',18),
('WORKFORCE PRO WF-C6590',2,'si','si','si','si','no',8);

INSERT INTO equipo (serie_equipo,id_marca,id_modelo,contador,id_cliente)
VALUES
('VQHY025302',2,7,1000,1),
('W915P106688',5,2,500,2),
('35P9720',4,6,400,3),
('E364M420324',5,1,900,4),
('T423MC30140',5,3,2000,5),
('CNB2N8JT8Z',3,4,650,6),
('F64383HGJ242',1,5,700,7);                                 

INSERT INTO provincia (nombre_provincia)
VALUES
('Buenos Aires'),
('Ciudad Autónoma de Buenos Aires'),
('Catamarca'),
('Chaco'),
('Chubut'),
('Córdoba'),
('Corrientes'),
('Entre Ríos'),
('Formosa'),
('Jujuy'),
('La Pampa'),
('La Rioja'),
('Mendoza'),
('Misiones'),
('Neuquén'),
('Río Negro'),
('Salta'),
('San Juan'),
('San Luis'),
('Santa Fe'),
('Santiago del Estero'),
('Tierra del Fuego, Antártida e Islas del Atlántico Sur'),
('Tucumán');

/* PERTENECE AL SEGMENTO DATOS DEL CLIENTE */

INSERT INTO cliente (nombre_cliente,direccion_cliente,id_provincia,sector_cliente)
VALUES
('DAMIAN PLACIDO MEDINA','CATALINA ALSINA 151',4,'LOCAL COMERCIAL'),
('FRESENIUS MEDICAL CARE ARGENTINA S.A.','CORRIENTES 70',4,'LABORATORIO'),
('A.P.A. -  ADMINISTRACION PROVINCIAL DEL  AGUA','R NICOLAS AVELLANEDA - KM 12,5 0',4,'ADMINISTRACION'),
('CARLOs ACOSTA','AV. LIBERTADOR 2391',14,'LOCAL COMERCIAL'),
('DANIEL AGOSTO','MOLINA 449',4,'IMPRENTA'),
('LICORES DEL NORDESTE','RUTA 12 KM 1027',7,'DEPOSITO'),
('ASOCIACION MUTUAL ACCEDER','AMEGHINO 201',4,'ADMINISTRACION');                                  

INSERT INTO telefono_cliente (numero_telefono,telefono_pertenece)
VALUES
('3624632479',1),
('444 0250',2),
('3624830902',2),
('4419996',3),
('03751482378',4),
('4972103',5),
('4483500',6),
('4484500',6),
('4480746',6),
('445 2037',7),
('4437085',7);

INSERT INTO email_cliente (direccion_email,email_pertenece)
VALUES
('damianmedina86@hotmail.com',1),
('444 0250',2),
('3624830902',2),
('apa.compras2020@gmail.com',3),
('rivasnady@gmail.com',3),
('carlosr_acosta@arnet.com.ar',4),
('imprentamontecarlo@gmail.com',4),
('dygagosto3@yahoo.com',5),
('sistemas@cabalgata.com.ar',6),
('licoresnordeste@hotmail.com',6),
('secretaria@cabalgata.com.ar',6),
('proveedores@cabalgata.com.ar',6),
('enrique-alfonsi@mutualacceder.com.ar',7);

/* PERTENECE AL SEGMENTO DATOS DE STOCK */

INSERT INTO stock (id_producto,tipo_producto,nombre_producto,precio_producto,cantidad,cantidad_minima)
VALUES
('AD027018','repuesto','Charge Roller',20.5,20),
('AE020207','repuesto','Pressure Roller',15.0,50),
('AE044072','repuesto','Stripper Pawls ',0.5,120),
('B2969640','repuesto','Developer Black ',75.5,70),
('480-0238','insumo','Photoconductor Unit Type 1515 ',120.5,15);

/* PERTENECE AL SEGMENTO DATOS DE RRHH */

INSERT INTO puesto (nombre_puesto,descripcion_puesto)
VALUES
('tecnico','asignado a trabajadores con aptitudes para trabajar sobre las maquinas'),
('Administrativo','asignado a trabajadores de tareas generales'),
('supervisor','asignado a trabajadores con tareas de control y organizacion'),
('vendedor','asignado a trabajadores con tareas de ventas');

INSERT INTO rrhh (nombre_trabajador,apellido_trabajador,direccion_trabajador,telefono_trabajador,email_trabajador,puesto_trabajador)
VALUES
('JUAN MATIAS','VILLAVERDE','Pasaje Brown N° 2328','0362-154850414','villaverde.06@gmail.com',2),
('FRANCISCO RAMON','SANCHEZ','Pasaje Gabriel Carrasco Nº 3125 Villa Don Andres','','0362-154162063',2),
('MAXIMILIANO','HOLSBACH','J D PERON 702 ','0362-15598304','andresholsbach@gmail.com',3),
('GERMAN EDGARDO','MASSARO','Mz 29 Pc 4 Chacra 40 Bº Malvinas Argentinas 2','0362-154624110','castillo_leyes@hotmail.com',4),
('LEONARDO','VERA','Calle Lino Torres N° 122','0362-15299206','leonardov129@gmail.com',1);

INSERT INTO trabajo (nombre_trabajo,descripcion_trabajo)
VALUES
('inicializacion','desembalar equipo y ejecutar inicializacion segun procesos del manual'),
('Venta','solicitar datos del prospecto y realizar las tareas de venta segun manual de procesos'),
('facturar','solicitar los datos al vendedor y registrar la venta'),
('reparacion','solicitar los datos al supervisor del trabajo a realizar');

/* PERTENECE AL SEGMENTO DATOS DE COMERCIALIZACION */

INSERT INTO venta (id_cliente,id_producto,id_trabajador,id_trabajo)
VALUES
(1,'AD027018',1,3),
(5,'B2969640',5,4),
(2,'AE044072',5,4);