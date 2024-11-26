-- Active: 1694371430850@@127.0.0.1@3306@suim
create DATABASE suim ;

use suim;

-- Tabla Tipos de Documento
CREATE TABLE tipos_documento (
    id_tipo_documento INT PRIMARY KEY AUTO_INCREMENT,
    nombre_tipo_documento VARCHAR(100) NOT NULL
);

-- Tabla Beneficiarios
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
    numero_movil1 VARCHAR(20),
    numero_movil2 VARCHAR(20),
    numero_fijo VARCHAR(20),
    email VARCHAR(100),
    nivel_educativo_mas_alto VARCHAR(50),
    sabe_leer_y_escribir BOOLEAN,
    discapacidad BOOLEAN,
    grupo_etnico VARCHAR(50),
    grupo_indigena VARCHAR(50),
    otro_grupo_indigena VARCHAR(50),
    identidad_de_genero VARCHAR(50),
    otra_identidad_de_genero VARCHAR(50),
    orientacion_sexual VARCHAR(50),
    otra_orientacion_sexual VARCHAR(50),
    actividad_sin_remuneracion BOOLEAN,
    trabajo_remunerado BOOLEAN,
    id_ruta INT,
    nombre_ruta VARCHAR(100),
    id_proyecto_inversion INT,
    nombre_proyecto_inversion VARCHAR(100),
    id_meta_plan INT,
    nombre_meta_plan VARCHAR(100),
    id_meta_proyecto INT,
    nombre_meta_proyecto VARCHAR(100),
    id_iniciativa INT,
    nombre_iniciativa VARCHAR(100),
    id_convenio INT,
    nombre_convenio VARCHAR(100),
    id_direccion INT,
    nombre_direccion VARCHAR(100),
    id_subdireccion INT,
    nombre_subdireccion VARCHAR(100),
    segplan VARCHAR(50),
    edad INT,
    grupo_etario VARCHAR(50),
    id_sector INT,  -- Nueva relación con sectores económicos
    id_actividad_economica INT,  -- Nueva relación con actividades económicas
    FOREIGN KEY (id_departamento_residencia) REFERENCES ubicaciones_departamentos(id_departamento),
    FOREIGN KEY (id_municipio_residencia) REFERENCES ubicaciones_municipios(id_municipio),
    FOREIGN KEY (id_localidad_residencia) REFERENCES ubicaciones_localidades(id_localidad),
    FOREIGN KEY (id_upz_residencia) REFERENCES ubicaciones_upz(id_upz),
    FOREIGN KEY (id_barrio_residencia) REFERENCES ubicaciones_barrios(id_barrio),
    FOREIGN KEY (id_sector) REFERENCES sectores_economicos(id_sector),
    FOREIGN KEY (id_actividad_economica) REFERENCES actividades_economicas(id_actividad)
);

-- Tabla Unidades Productivas
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
    numero_movil1_unidad_productiva VARCHAR(20),
    numero_movil2_unidad_productiva VARCHAR(20),
    numero_fijo_unidad_productiva VARCHAR(20),
    email_unidad_productiva VARCHAR(100),
    actividad_despues_seis VARCHAR(100),
    id_ruta_unidad_productiva INT,
    nombre_ruta_unidad_productiva VARCHAR(100),
    id_proyecto_inversion_unidad_productiva INT,
    nombre_proyecto_inversion_unidad_productiva VARCHAR(100),
    id_meta_plan_unidad_productiva INT,
    nombre_meta_plan_unidad_productiva VARCHAR(100),
    id_meta_proyecto_unidad_productiva INT,
    nombre_meta_proyecto_unidad_productiva VARCHAR(100),
    id_iniciativa_unidad_productiva INT,
    nombre_iniciativa_unidad_productiva VARCHAR(100),
    id_convenio_unidad_productiva INT,
    nombre_convenio_unidad_productiva VARCHAR(100),
    id_direccion_unidad_productiva INT,
    nombre_direccion_unidad_productiva VARCHAR(100),
    id_subdireccion_unidad_productiva INT,
    nombre_subdireccion_unidad_productiva VARCHAR(100),
    segplan_unidad_productiva VARCHAR(50),
    id_sector INT,  -- Relación con sectores económicos
    id_actividad_economica INT,  -- Relación con actividades económicas
    id_organizacion INT,  -- Relación con organizaciones
    id_medio_comercializacion INT,  -- Relación con medios de comercialización
    id_medio_pago INT,  -- Relación con medios de pago
    FOREIGN KEY (id_tipo_documento_beneficiario) REFERENCES tipos_documento(id_tipo_documento),
    FOREIGN KEY (id_departamento_unidad_productiva) REFERENCES ubicaciones_departamentos(id_departamento),
    FOREIGN KEY (id_municipio_unidad_productiva) REFERENCES ubicaciones_municipios(id_municipio),
    FOREIGN KEY (id_localidad_unidad_productiva) REFERENCES ubicaciones_localidades(id_localidad),
    FOREIGN KEY (id_upz_unidad_productiva) REFERENCES ubicaciones_upz(id_upz),
    FOREIGN KEY (id_barrio_unidad_productiva) REFERENCES ubicaciones_barrios(id_barrio),
    FOREIGN KEY (id_sector) REFERENCES sectores_economicos(id_sector),
    FOREIGN KEY (id_actividad_economica) REFERENCES actividades_economicas(id_actividad),
    FOREIGN KEY (id_organizacion) REFERENCES organizaciones(id_organizacion),
    FOREIGN KEY (id_medio_comercializacion) REFERENCES medios_comercializacion(id_medios),
    FOREIGN KEY (id_medio_pago) REFERENCES medios_pago(id_pago)
);

-- Tabla Ubicaciones Departamentos
CREATE TABLE ubicaciones_departamentos (
    id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    nombre_departamento VARCHAR(100) NOT NULL
);

-- Tabla Ubicaciones Municipios
CREATE TABLE ubicaciones_municipios (
    id_municipio INT PRIMARY KEY AUTO_INCREMENT,
    id_departamento INT,
    nombre_municipio VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_departamento) REFERENCES ubicaciones_departamentos(id_departamento)
);

-- Tabla Ubicaciones Localidades
CREATE TABLE ubicaciones_localidades (
    id_localidad INT PRIMARY KEY AUTO_INCREMENT,
    id_municipio INT,
    nombre_localidad VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_municipio) REFERENCES ubicaciones_municipios(id_municipio)
);

-- Tabla Ubicaciones UPZ
CREATE TABLE ubicaciones_upz (
    id_upz INT PRIMARY KEY AUTO_INCREMENT,
    id_localidad INT,
    nombre_upz VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_localidad) REFERENCES ubicaciones_localidades(id_localidad)
);

-- Tabla Ubicaciones Barrios
CREATE TABLE ubicaciones_barrios (
    id_barrio INT PRIMARY KEY AUTO_INCREMENT,
    id_upz INT,
    nombre_barrio VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_upz) REFERENCES ubicaciones_upz(id_upz)
);

-- Tabla Contactos
CREATE TABLE contactos (
    id_contacto INT PRIMARY KEY AUTO_INCREMENT,
    numero_movil1 VARCHAR(20),
    numero_movil2 VARCHAR(20),
    numero_fijo VARCHAR(20),
    email VARCHAR(100)
);

-- Tabla Sectores Económicos
CREATE TABLE sectores_economicos (
    id_sector INT PRIMARY KEY AUTO_INCREMENT,
    nombre_sector VARCHAR(100) NOT NULL
);

-- Tabla Actividades Económicas
CREATE TABLE actividades_economicas (
    id_actividad INT PRIMARY KEY AUTO_INCREMENT,
    codigo_ciiu VARCHAR(20),
    descripcion_actividad TEXT,
    producto_principal VARCHAR(100)
);

-- Tabla Organizaciones
CREATE TABLE organizaciones (
    id_organizacion INT PRIMARY KEY AUTO_INCREMENT,
    tipo_organizacion VARCHAR(100),
    otro_tipo_organizacion VARCHAR(100)
);

-- Tabla Medios de Comercialización
CREATE TABLE medios_comercializacion (
    id_medios INT PRIMARY KEY AUTO_INCREMENT,
    nombre_medio VARCHAR(100)
);

-- Tabla Medios de Pago
CREATE TABLE medios_pago (
    id_pago INT PRIMARY KEY AUTO_INCREMENT,
    nombre_pago VARCHAR(100)
);
