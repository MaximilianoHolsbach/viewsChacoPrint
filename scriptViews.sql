use chaco_print;

CREATE OR REPLACE VIEW cliente_email AS
(select c.id_cliente, c.nombre_cliente, email.direccion_email
from cliente c 
join email_cliente email on c.id_cliente = email.email_pertenece);

CREATE OR REPLACE VIEW equipo_cliente as
(select e.serie_equipo, c.nombre_cliente
from equipo e
join cliente c on e.id_cliente = c.id_cliente);

CREATE OR REPLACE VIEW multifuncion_monocromatica as
(select id_modelo, nombre_modelo 
from modelo 
where (imprime and escanea = 'si') and (color = 'no'));

CREATE OR REPLACE VIEW control_precio as
(select id_producto, tipo_producto, nombre_producto, precio_producto 
from stock
where precio_producto >=(
select avg(precio_producto) from stock));

CREATE OR REPLACE VIEW control_datos_rrhh as
(select id_trabajador,nombre_trabajador
from rrhh
where telefono_trabajador = '');

CREATE OR REPLACE VIEW control_stock as
(select id_producto, tipo_producto, nombre_producto, cantidad
from stock
where cantidad <= cantidad_minima);  

CREATE OR REPLACE VIEW compatible as
(select e.id_modelo, s.id_producto, s.nombre_producto
from stock s
join usado_en e on s.id_producto = e.id_producto order by e.id_modelo);