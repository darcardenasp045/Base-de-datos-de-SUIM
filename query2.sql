CREATE TABLE ubicaciones_departamentos (
    id_departamento INT PRIMARY KEY,
    nombre_departamento VARCHAR(100) NOT NULL
);

-- Tabla de Municipios
CREATE TABLE ubicaciones_municipios (
    id_municipio INT PRIMARY KEY,
    id_departamento INT,
    nombre_municipio VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_departamento) REFERENCES ubicaciones_departamentos(id_departamento)
);

-- Tabla de Localidades
CREATE TABLE ubicaciones_localidades (
    id_localidad INT PRIMARY KEY,
    id_municipio INT,
    nombre_localidad VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_municipio) REFERENCES ubicaciones_municipios(id_municipio)
);

-- Tabla de UPZs
CREATE TABLE ubicaciones_upz (
    id_upz INT PRIMARY KEY,
    id_localidad INT,
    nombre_upz VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_localidad) REFERENCES ubicaciones_localidades(id_localidad)
);

-- Tabla de Barrios
CREATE TABLE ubicaciones_barrios (
    id_barrio INT PRIMARY KEY,
    id_upz INT,
    nombre_barrio VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_upz) REFERENCES ubicaciones_upz(id_upz)
);

-- Tabla de Contactos
CREATE TABLE contactos (
    id_contacto INT PRIMARY KEY AUTO_INCREMENT,
    numero_movil1 VARCHAR(20),
    numero_movil2 VARCHAR(20),
    numero_fijo VARCHAR(20),
    email VARCHAR(100)
);

-- Tabla de Iniciativas
CREATE TABLE Iniciativas (
    ID_INICIATIVA INT PRIMARY KEY,
    NOMBRE_INICIATIVA VARCHAR(255) NOT NULL
);

-- Tabla de Convenios
CREATE TABLE Convenios (
    ID_CONVENIO INT PRIMARY KEY,
    NOMBRE_CONVENIO VARCHAR(255) NOT NULL
);

-- Tabla de Direcciones
CREATE TABLE Direcciones (
    ID_DIRECCION INT PRIMARY KEY,
    NOMBRE_DIRECCION VARCHAR(255) NOT NULL
);

-- Tabla de Subdirecciones
CREATE TABLE Subdirecciones (
    ID_SUBDIRECCION INT PRIMARY KEY,
    NOMBRE_SUBDIRECCION VARCHAR(255) NOT NULL
);

-- Tabla de Rutas
CREATE TABLE Rutas (
    ID_RUTA INT PRIMARY KEY,
    NOMBRE_RUTA VARCHAR(255) NOT NULL
);

-- Tabla de Proyectos de Inversión
CREATE TABLE ProyectosInversion (
    ID_PROYECTO_INVERSION INT PRIMARY KEY,
    NOMBRE_PROYECTO_INVERSION VARCHAR(255) NOT NULL
);

-- Tabla de Metas Plan
CREATE TABLE MetasPlan (
    ID_META_PLAN INT PRIMARY KEY,
    NOMBRE_META_PLAN VARCHAR(255) NOT NULL
);

-- Tabla de Metas Proyecto
CREATE TABLE MetasProyecto (
    ID_META_PROYECTO INT PRIMARY KEY,
    NOMBRE_META_PROYECTO VARCHAR(255) NOT NULL
);

-- Tabla de Relaciones entre las entidades
CREATE TABLE Relaciones (
    ID_PERFIL INT PRIMARY KEY,
    ID_RUTA INT,
    ID_PROYECTO_INVERSION INT,
    ID_META_PLAN INT,
    ID_META_PROYECTO INT,
    ID_INICIATIVA INT,
    ID_CONVENIO INT,
    ID_DIRECCION INT,
    ID_SUBDIRECCION INT,
    FOREIGN KEY (ID_RUTA) REFERENCES Rutas(ID_RUTA),
    FOREIGN KEY (ID_PROYECTO_INVERSION) REFERENCES ProyectosInversion(ID_PROYECTO_INVERSION),
    FOREIGN KEY (ID_META_PLAN) REFERENCES MetasPlan(ID_META_PLAN),
    FOREIGN KEY (ID_META_PROYECTO) REFERENCES MetasProyecto(ID_META_PROYECTO),
    FOREIGN KEY (ID_INICIATIVA) REFERENCES Iniciativas(ID_INICIATIVA),
    FOREIGN KEY (ID_CONVENIO) REFERENCES Convenios(ID_CONVENIO),
    FOREIGN KEY (ID_DIRECCION) REFERENCES Direcciones(ID_DIRECCION),
    FOREIGN KEY (ID_SUBDIRECCION) REFERENCES Subdirecciones(ID_SUBDIRECCION)
);

-- Tabla Beneficiarios (modificada)
CREATE TABLE beneficiarios (
    numero_documento_identificacion VARCHAR(50) PRIMARY KEY,
    primer_nombre VARCHAR(100),
    otros_nombres VARCHAR(100),
    primer_apellido VARCHAR(100),
    segundo_apellido VARCHAR(100),
    sexo_asignado_al_nacer VARCHAR(20),
    fecha_nacimiento DATE,
    estado_civil VARCHAR(50),
    id_departamento_residencia INT,
    id_municipio_residencia INT,
    id_localidad_residencia INT,
    id_upz_residencia INT,
    id_barrio_residencia INT,
    zona_residencia VARCHAR(50),
    estrato INT,
    direccion_via VARCHAR(100),
    direccion_numero VARCHAR(50),
    direccion_letra VARCHAR(10),
    direccion_letra_bis VARCHAR(10),
    vereda_residencia VARCHAR(100),
    nombre_finca VARCHAR(100),
    id_contacto INT,  -- Clave foránea a la tabla Contactos
    id_iniciativa INT, -- Clave foránea a la tabla Iniciativas
    id_convenio INT,   -- Clave foránea a la tabla Convenios
    id_direccion INT,  -- Clave foránea a la tabla Direcciones
    id_subdireccion INT, -- Clave foránea a la tabla Subdirecciones
    id_ruta INT,  -- Clave foránea a la tabla Rutas
    id_proyecto_inversion INT, -- Clave foránea a la tabla ProyectosInversion
    id_meta_plan INT,  -- Clave foránea a la tabla MetasPlan
    id_meta_proyecto INT, -- Clave foránea a la tabla MetasProyecto
    FOREIGN KEY (id_departamento_residencia) REFERENCES ubicaciones_departamentos(id_departamento),
    FOREIGN KEY (id_municipio_residencia) REFERENCES ubicaciones_municipios(id_municipio),
    FOREIGN KEY (id_localidad_residencia) REFERENCES ubicaciones_localidades(id_localidad),
    FOREIGN KEY (id_upz_residencia) REFERENCES ubicaciones_upz(id_upz),
    FOREIGN KEY (id_barrio_residencia) REFERENCES ubicaciones_barrios(id_barrio),
    FOREIGN KEY (id_contacto) REFERENCES contactos(id_contacto),
    FOREIGN KEY (id_iniciativa) REFERENCES Iniciativas(ID_INICIATIVA),
    FOREIGN KEY (id_convenio) REFERENCES Convenios(ID_CONVENIO),
    FOREIGN KEY (id_direccion) REFERENCES Direcciones(ID_DIRECCION),
    FOREIGN KEY (id_subdireccion) REFERENCES Subdirecciones(ID_SUBDIRECCION),
    FOREIGN KEY (id_ruta) REFERENCES Rutas(ID_RUTA),
    FOREIGN KEY (id_proyecto_inversion) REFERENCES ProyectosInversion(ID_PROYECTO_INVERSION),
    FOREIGN KEY (id_meta_plan) REFERENCES MetasPlan(ID_META_PLAN),
    FOREIGN KEY (id_meta_proyecto) REFERENCES MetasProyecto(ID_META_PROYECTO)
);

-- Tabla Unidades Productivas (modificada)
CREATE TABLE unidades_productivas (
    numero_documento_identificacion VARCHAR(50) PRIMARY KEY,
    cargo VARCHAR(100),
    nombre_comercial VARCHAR(100),
    id_tipo_documento_beneficiario INT,
    id_departamento_unidad_productiva INT,
    id_municipio_unidad_productiva INT,
    id_localidad_unidad_productiva INT,
    id_upz_unidad_productiva INT,
    id_barrio_unidad_productiva INT,
    zona_unidad_productiva VARCHAR(50),
    estrato INT,
    direccion_via_unidad_productiva VARCHAR(100),
    direccion_numero_unidad_productiva VARCHAR(50),
    direccion_letra_unidad_productiva VARCHAR(10),
    direccion_letra_bis_unidad_productiva VARCHAR(10),
    vereda_unidad_productiva VARCHAR(100),
    nombre_finca_unidad_productiva VARCHAR(100),
    id_contacto INT,  -- Clave foránea a la tabla Contactos
    id_iniciativa INT, -- Clave foránea a la tabla Iniciativas
    id_convenio INT,   -- Clave foránea a la tabla Convenios
    id_direccion INT,  -- Clave foránea a la tabla Direcciones
    id_subdireccion INT, -- Clave foránea a la tabla Subdirecciones
    id_ruta INT,  -- Clave foránea a la tabla Rutas
    id_proyecto_inversion INT, -- Clave foránea a la tabla ProyectosInversion
    id_meta_plan INT,  -- Clave foránea a la tabla MetasPlan
    id_meta_proyecto INT, -- Clave foránea a la tabla MetasProyecto
    FOREIGN KEY (id_departamento_unidad_productiva) REFERENCES ubicaciones_departamentos(id_departamento),
    FOREIGN KEY (id_municipio_unidad_productiva) REFERENCES ubicaciones_municipios(id_municipio),
    FOREIGN KEY (id_localidad_unidad_productiva) REFERENCES ubicaciones_localidades(id_localidad),
    FOREIGN KEY (id_upz_unidad_productiva) REFERENCES ubicaciones_upz(id_upz),
    FOREIGN KEY (id_barrio_unidad_productiva) REFERENCES ubicaciones_barrios(id_barrio),
    FOREIGN KEY (id_contacto) REFERENCES contactos(id_contacto),
    FOREIGN KEY (id_iniciativa) REFERENCES Iniciativas(ID_INICIATIVA),
    FOREIGN KEY (id_convenio) REFERENCES Convenios(ID_CONVENIO),
    FOREIGN KEY (id_direccion) REFERENCES Direcciones(ID_DIRECCION),
    FOREIGN KEY (id_subdireccion) REFERENCES Subdirecciones(ID_SUBDIRECCION),
    FOREIGN KEY (id_ruta) REFERENCES Rutas(ID_RUTA),
    FOREIGN KEY (id_proyecto_inversion) REFERENCES ProyectosInversion(ID_PROYECTO_INVERSION),
    FOREIGN KEY (id_meta_plan) REFERENCES MetasPlan(ID_META_PLAN),
    FOREIGN KEY (id_meta_proyecto) REFERENCES MetasProyecto(ID_META_PROYECTO)
);
