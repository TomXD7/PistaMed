create database PistaMed;
use PistaMed;

create table proveedor(
	idproveedor int primary key identity,
	nombre varchar(30) not null,
	direccion varchar(500),
	telefono varchar(8) not null,
	correo varchar(50) not null,
);

create table rol(
	idrol int primary key identity,
	rol varchar(30) not null
);

create table menu(
idmenu int NOT NULL identity,
menu varchar(50) NOT NULL,
descripcion varchar(100),
url varchar(300),
idpadre int,
PRIMARY KEY(idmenu),
FOREIGN KEY (idpadre) REFERENCES menu (idmenu)
);

create table permiso(
idpermiso int NOT NULL identity,
idmenu int NOT NULL,
idrol int NOT NULL,
PRIMARY KEY (idpermiso),
FOREIGN KEY (idmenu) REFERENCES menu (idmenu),
FOREIGN KEY (idrol) REFERENCES rol (idrol)
);

create table usuario(
	idusuario varchar(25) primary key not null,
	nombres varchar(30) not null,
	apellidos varchar(30) not null,
	correo varchar(50) not null,
	clave varchar(100)not null,
	idrol int not null,
	foreign key (idrol) references rol (idrol)
);

create table presentacion(
	idpresentacion int primary key identity,
	nombre varchar(30) not null
);

create table categoria(
	idcategoria int primary key identity,
	nombre varchar(30) not null
);

create table producto(
	idproducto int primary key identity,
	nombre varchar(30) not null,
	precio decimal(3,2) not null,
	fechavencimiento datetime not null,
	existencia varchar(500) not null,
	idcategoria int not null,
	idpresentacion int not null,
	foreign key (idcategoria) references categoria (idcategoria),
	foreign key (idpresentacion) references presentacion (idpresentacion)

);

create table detallecompra(
	iddetallecompra int primary key identity,
	idproducto int not null,
	cantidad int not null,
	preciounitario decimal(3,2) not null,
	total decimal(3,2) not null

);

create table compra(
	idcompra int primary key identity,
	fecha datetime not null,
	idproveedor int not null,
	iddetallecompra int not null,
	idusuario varchar(25) not null,
	foreign key (idproveedor) references proveedor (idproveedor),
	foreign key (iddetallecompra) references detallecompra (iddetallecompra),
	foreign key (idusuario) references usuario (idusuario) 
);

create table detallefactura(
	iddetallefactura int primary key identity,
	cantidad int not null,
	precioventa decimal(3,2) not null,
	idproducto int not null,
	foreign key (idproducto) references producto (idproducto)
);

create table factura(
	idfactura int primary key identity,
	subtotal decimal(3,2) not null,
	total decimal(3,2) not null,
	descuento decimal(3,2) not null,
	nombresujeto varchar(30) not null,
	fecha datetime not null,
	idusuario varchar(25) not null,
	iddetallefactura int not null,
	foreign key (idusuario) references usuario (idusuario),
	foreign key (iddetallefactura) references detallefactura (iddetallefactura)
); 

drop database PistaMed;