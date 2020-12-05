INSERT INTO USUARIO VALUES('zaida','Zaida','Rivas', 
'zrivas@gmail.com',lower(CONVERT(VARCHAR(64),HashBytes('SHA2_256', 'admin'),2)), 1);

INSERT INTO USUARIO VALUES('tomas','Tomas','Morataya', 
'tmorataya@gmail.com',lower(CONVERT(VARCHAR(64),HashBytes('SHA2_256', 'admin'),2)), 2);

INSERT INTO USUARIO VALUES('chove','Roberto','Mendez', 
'rmendez@gmail.com', lower(CONVERT(VARCHAR(64),HashBytes('SHA2_256', 'hola123'),2)), 3);

alter table usuario add correo varchar(100);

insert into rol(rol) values ('Administador');
insert into rol(rol) values ('Gerente');
insert into rol(rol) values ('Cajero');

set identity_insert menu on;

insert into menu(idmenu, menu, descripcion, url, idpadre) values(1, 'Inicio', '','/Principal', null);insert into menu(idmenu, menu, descripcion, url, idpadre) values(2, 'Usuario', '','/Principal', null);insert into menu(idmenu, menu, descripcion, url, idpadre) values(3, 'Compras', '','/Principal', null);insert into menu(idmenu, menu, descripcion, url, idpadre) values(4, 'Ventas', '','/Principal', null);insert into menu(idmenu, menu, descripcion, url, idpadre) values(5, 'Productos', '','/Principal', null);insert into menu(idmenu, menu, descripcion, url, idpadre) values(6, 'Roles', '','/Rol', 2);
insert into menu(idmenu, menu, descripcion, url, idpadre) values(7, 'Menu', '','/Menu', 2);
insert into menu(idmenu, menu, descripcion, url, idpadre) values(8, 'Permisos', '','/Permisos', 2);
insert into menu(idmenu, menu, descripcion, url, idpadre) values(9, 'Registrarse', '','/Usuarios', 2);insert into menu(idmenu, menu, descripcion, url, idpadre) values(10, 'Presentacion', '','/Presentacion', 5);insert into menu(idmenu, menu, descripcion, url, idpadre) values(11, 'Categoria', '','/Categoria', 5);insert into menu(idmenu, menu, descripcion, url, idpadre) values(12, 'Productos', '','/Productos', 5);insert into permiso(idmenu, idrol) select idmenu, 1 from menu;
insert into permiso(idmenu, idrol) select idmenu, 2 from menu where idmenu in (1,3,4,5,10,11,12);
insert into permiso(idmenu, idrol) select idmenu, 3 from menu where idmenu in (1,4);