/*==============================================================*/
/* Database name:  hcd_devel                                    */
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     29/10/2018 0:39:36                           */
/*==============================================================*/


drop database if exists hcd_devel;

/*==============================================================*/
/* Database: hcd_devel                                          */
/*==============================================================*/
create database hcd_devel;

use hcd_devel;

/*==============================================================*/
/* Table: auditoria                                             */
/*==============================================================*/
create table auditoria
(
   idAuditoria          int not null,
   auditoriaModulo      varchar(250),
   auditoriaAccion      text,
   auditoriaValor       varchar(250),
   auditoriaFecha       datetime,
   auditoriaUsuario     int,
   auditoriaIP          varchar(15),
   auditoriaVigencia    datetime,
   primary key (idAuditoria)
);

/*==============================================================*/
/* Table: broker                                                */
/*==============================================================*/
create table broker
(
   idBroker             int not null,
   idPersona            int,
   brokerNombre         varchar(200),
   brokerCodigo         varchar(5),
   brokerVigencia       boolean,
   primary key (idBroker)
);

/*==============================================================*/
/* Table: campo_cd                                              */
/*==============================================================*/
create table campo_cd
(
   CDID                 bigint,
   idPaciente           int(11),
   CCDFecha             timestamp
)
type = InnoDB;

/*==============================================================*/
/* Table: caracteristica                                        */
/*==============================================================*/
create table caracteristica
(
   IDcaracteristica     int not null,
   caracteristicaNombre varchar(150),
   caracteristicaCampo  varchar(150),
   caracteristicaTipo   varchar(50),
   caracteristicaVigencia boolean,
   primary key (IDcaracteristica)
)
type = InnoDB;

/*==============================================================*/
/* Table: caracteristica_dato                                   */
/*==============================================================*/
create table caracteristica_dato
(
   CDID                 bigint not null,
   IDcaracteristica     int,
   CDValorInt           int,
   CDValorText          text,
   CDValorBoolean       boolean,
   CDValorBlob          blob,
   CDValorTime          timestamp,
   CDFecha              timestamp,
   primary key (CDID)
)
type = InnoDB;

/*==============================================================*/
/* Table: certificado                                           */
/*==============================================================*/
create table certificado
(
   idCertificado        int not null,
   idPaciente           int(11),
   certificadoFecha     datetime,
   certificadoContenido blob,
   certificadoAdjunto   blob,
   certificadoActivo    boolean,
   primary key (idCertificado)
);

/*==============================================================*/
/* Table: ciudad                                                */
/*==============================================================*/
create table ciudad
(
   idCiudad             bigint not null,
   idProvincia          int,
   ciudadNombre         varchar(200),
   ciudadCodigo         varchar(5),
   ciudadDescripcion    text,
   ciudadUbicacion      varchar(200),
   ciudadFecha          datetime,
   ciudadVigencia       boolean,
   primary key (idCiudad)
)
type = InnoDB;

/*==============================================================*/
/* Table: clasesocial                                           */
/*==============================================================*/
create table clasesocial
(
   idClaseSocial        varchar(5) not null,
   claseSocial          varchar(200),
   primary key (idClaseSocial),
   unique key claseSocial (claseSocial)
)
type = InnoDB;

/*==============================================================*/
/* Table: codigos                                               */
/*==============================================================*/
create table codigos
(
   idCodigos            int(11) not null auto_increment,
   codigoGrupo          varchar(20) character set latin1,
   codigoIdentificador  varchar(100) character set latin1,
   codigoDescripcion    text character set latin1,
   codigoValor1         text character set latin1,
   codigoValor2         text character set latin1,
   codigoValor3         text character set latin1,
   primary key (idCodigos)
)
type = InnoDB;

/*==============================================================*/
/* Table: consulta                                              */
/*==============================================================*/
create table consulta
(
   idConsulta           bigint not null,
   idPaciente           int(11),
   idUsuario            int(10),
   consultaObservacion  text,
   consultaAPP          longtext,
   consultaAPF          longtext,
   consultaEnfermedadAct longtext,
   consultaMC           longtext,
   consultaDiagnostico  varchar(150),
   consultaMTratante    varchar(250),
   consultaMEnviante    varchar(250),
   consultaFecha        datetime,
   consultaActualizado  datetime,
   consultaVigencia     boolean,
   primary key (idConsulta)
);

/*==============================================================*/
/* Table: descripcion                                           */
/*==============================================================*/
create table descripcion
(
   idDescripcion        int(11) not null auto_increment,
   idPaciente           int(11),
   descripcionFecha     datetime not null default '0000-00-00 00:00:00',
   descripcionEvolucion longtext,
   descripcionTratamiento longtext,
   descripcionEstudios  longtext,
   primary key (idDescripcion)
)
type = InnoDB;

/*==============================================================*/
/* Table: detalle                                               */
/*==============================================================*/
create table detalle
(
   idProducto           bigint not null,
   idImpuesto           int,
   primary key (idProducto)
);

/*==============================================================*/
/* Table: diagnostico                                           */
/*==============================================================*/
create table diagnostico
(
   idDiagnostico        int not null,
   diagnosticoCodigo    varchar(50),
   categoriaCodigos     varchar(50),
   diagnosticoFamilia   varchar(5),
   diagnosticoTipo      varchar(5),
   diagnosticoNombre    varchar(200) default NULL,
   diagnosticoDescripcion text,
   diagnosticoFecha     timestamp,
   diagnosticoActualizado timestamp,
   diagnosticoVigencia  boolean,
   primary key (idDiagnostico),
   key diagnosticoCategoria (diagnosticoNombre)
)
type = InnoDB;

/*==============================================================*/
/* Table: diagnostico_cat                                       */
/*==============================================================*/
create table diagnostico_cat
(
   idCategoria          int(11) not null auto_increment,
   categTitulo          varchar(250) default NULL,
   categCodigos         varchar(50) default NULL,
   categCapitulo        varchar(5) default NULL,
   primary key (idCategoria)
)
type = InnoDB;

/*==============================================================*/
/* Table: direccion                                             */
/*==============================================================*/
create table direccion
(
   idDireccion          bigint not null,
   idUsuario            int(10),
   idPaciente           int(11),
   idResidencia         varchar(5),
   idPersona            int,
   direccionTipo        varchar(15),
   direccionCiudad      bigint,
   direccionComunidad   varchar(150),
   direccionLongitud    varchar(30),
   direccionLatitud     varchar(30),
   direccionFecha       datetime,
   direccionActualizado datetime,
   direccionVigencia    boolean,
   primary key (idDireccion)
);

/*==============================================================*/
/* Table: especialidad                                          */
/*==============================================================*/
create table especialidad
(
   
);

/*==============================================================*/
/* Table: estadocivil                                           */
/*==============================================================*/
create table estadocivil
(
   idEstadoCivil        varchar(5) not null,
   estadoCivil          varchar(200),
   primary key (idEstadoCivil),
   unique key estadoCivil (estadoCivil)
)
type = InnoDB;

/*==============================================================*/
/* Table: etnia                                                 */
/*==============================================================*/
create table etnia
(
   idEtnia              int not null,
   etniaNombre          varchar(150),
   etniaVigencia        boolean,
   primary key (idEtnia)
);

/*==============================================================*/
/* Table: factura                                               */
/*==============================================================*/
create table factura
(
   idFactura            int not null,
   id_persona           int,
   facturaFechaAutorizacion datetime,
   facturaFechaEmision  datetime,
   facturaTipoComprobante varchar(5),
   facturaSerie         varchar(50),
   facturaSecuencial    numeric,
   facturaCodigo        varchar(10),
   facturaDigitoVerificador int,
   facturaST12          numeric,
   facturaST0           numeric,
   facturaSTNIVA        numeric,
   facturaSTEIVA        numeric,
   facturaST            numeric,
   facturaDescuento     numeric,
   facturaICE           numeric,
   facturaIRBPNR        numeric,
   facturaNombreEmisor  varchar(300),
   facturaNombreComercial varchar(300),
   facturaDireccionEmisor varchar(300),
   facturaCodigoEmisor  varchar(3),
   facturaContribuyenteEspecial varchar(13),
   facturaObligadoContabilidad varchar(2),
   facturaLogo          varchar(300),
   facturaTipoAmbiente  varchar(1),
   facturaTipoEmision   varchar(2),
   facturaIVA12         numeric,
   facturaPropina       numeric,
   facturaVT            numeric,
   primary key (idFactura)
);

/*==============================================================*/
/* Table: genero                                                */
/*==============================================================*/
create table genero
(
   idGenero             varchar(5) not null,
   generoDescripcion    varchar(200),
   primary key (idGenero),
   unique key generoDescripcion (generoDescripcion)
)
type = InnoDB;

/*==============================================================*/
/* Table: grupoedad                                             */
/*==============================================================*/
create table grupoedad
(
   idEdad               varchar(5) not null,
   edadNombre           varchar(15),
   edadValor1           int,
   edadValor2           int,
   primary key (idEdad)
)
type = InnoDB;

/*==============================================================*/
/* Table: grupos                                                */
/*==============================================================*/
create table grupos
(
   idGrupo              int not null,
   grupoTipo            varchar(5),
   grupoCodigo          varchar(5),
   grupoNombre          varchar(150),
   grupoDescripcion     varchar(250),
   grupoTexto           text,
   primary key (idGrupo)
);

alter table grupos comment 'paciente_plan PPTipo
caracteristica caracteristicaTipo';

/*==============================================================*/
/* Table: impuesto                                              */
/*==============================================================*/
create table impuesto
(
   idImpuesto           int not null,
   impuestoNombre       varchar(150),
   impuestoCodigo       varchar(10),
   impuestoValor        decimal(15,4),
   impuestoPorcentaje   decimal(15,4),
   impuestoFecha        datetime,
   impuestoVigencia     datetime,
   impuestoActivo       boolean,
   primary key (idImpuesto)
);

/*==============================================================*/
/* Table: institucion                                           */
/*==============================================================*/
create table institucion
(
   idInstitucion        int not null,
   institucionNombre    varchar(200),
   institucionDireccion text,
   institucionRUC       varchar(15),
   institucionNota      text,
   institucionFecha     timestamp,
   institucionVigencia  timestamp,
   primary key (idInstitucion)
)
type = InnoDB;

/*==============================================================*/
/* Table: instruccion                                           */
/*==============================================================*/
create table instruccion
(
   idInstruccion        varchar(5) not null,
   instruccDescripcion  varchar(200),
   primary key (idInstruccion),
   unique key instruccDescripcion (instruccDescripcion)
)
type = InnoDB;

/*==============================================================*/
/* Table: menu                                                  */
/*==============================================================*/
create table menu
(
   idMenu               int not null,
   menuNombre           varchar(150),
   menuDescripcion      text,
   menuOrden            int,
   menuNivel            int,
   menuSuborden         int,
   menuFecha            timestamp,
   menuActualizado      timestamp,
   menuVigencia         boolean,
   primary key (idMenu)
)
type = InnoDB;

/*==============================================================*/
/* Table: nivel                                                 */
/*==============================================================*/
create table nivel
(
   idNivel              int(11) not null,
   nivelNombre          varchar(150) default NULL,
   nivelFecha           char(10),
   nivelActualizado     char(10),
   primary key (idNivel)
)
type = InnoDB;

/*==============================================================*/
/* Table: paciente                                              */
/*==============================================================*/
create table paciente
(
   idPaciente           int(11) not null auto_increment,
   idGenero             varchar(5),
   idEstadoCivil        varchar(5),
   idClaseSocial        varchar(5),
   idEdad               varchar(5),
   idInstruccion        varchar(5),
   idEtnia              int,
   pacienteEtnia        varchar(250),
   pacienteCedula       varchar(50),
   pacienteNombre       varchar(30),
   pacienteApellido     varchar(30),
   pacienteOcupacion    varchar(50),
   pacienteNacimiento   datetime,
   pacienteEdad         decimal(10,2) not null default 0.00,
   pacienteEstado       int(5) default 1,
   pacienteMTratante    varchar(250),
   pacienteMEnviante    varchar(250),
   pacienteTelefono     varchar(50),
   pacienteTelefono2    varchar(50),
   pacienteEmail        varchar(100),
   pacienteObservacion  varchar(150),
   pacienteDiagnostico  varchar(250),
   idUsuario            int(11) default 1,
   pacienteFecha        datetime not null default '0000-00-00 00:00:00',
   pacienteActualizado  varchar(100),
   pacienteVigencia     boolean,
   primary key (idPaciente)
)
type = InnoDB;

alter table paciente comment 'residencia es la dirección actual

código de res';

/*==============================================================*/
/* Table: paciente_diagnostico                                  */
/*==============================================================*/
create table paciente_diagnostico
(
   idPaciente           int(11),
   idDiagnostico        varchar(10),
   idUsuario            int(10),
   PDFecha              timestamp,
   PDActualizado        timestamp,
   PDVigencia           boolean
)
type = InnoDB;

/*==============================================================*/
/* Table: paciente_pg                                           */
/*==============================================================*/
create table paciente_pg
(
   idPaciente           int(11),
   idPlanesGrupo        int
);

/*==============================================================*/
/* Table: paciente_plan                                         */
/*==============================================================*/
create table paciente_plan
(
   idPacientePlan       bigint not null,
   idPaciente           int(11),
   idSeguroPlan         int,
   idBroker             int,
   PPTipo               varchar(5),
   primary key (idPacientePlan)
)
type = InnoDB;

/*==============================================================*/
/* Table: pais                                                  */
/*==============================================================*/
create table pais
(
   idPais               int not null,
   paisNombre           varchar(150),
   paisCodigo           varchar(10),
   paisDescripcion      text,
   paisVigencia         boolean,
   primary key (idPais)
)
type = InnoDB;

/*==============================================================*/
/* Table: pedidos                                               */
/*==============================================================*/
create table pedidos
(
   idPedido             int(11) not null auto_increment,
   pedidoFecha          timestamp not null default CURRENT_TIMESTAMP,
   pedidoTipo           int(11) default NULL,
   idPaciente           int(11) not null,
   pedidoMed            text,
   pedidoInd            text,
   pedidoCampo1         text,
   pedidoCampo2         text,
   pedidoActualizado    datetime,
   pedidoAprobado       varchar(5),
   pedidoVigencia       boolean,
   primary key (idPedido)
)
type = InnoDB;

/*==============================================================*/
/* Table: permisos                                              */
/*==============================================================*/
create table permisos
(
   idPermisos           int not null,
   idMenu               int,
   permisosNombre       varchar(150),
   permisosDescripcion  text,
   permisosFecha        timestamp,
   permisosActualizado  timestamp,
   permisosVigencia     boolean,
   primary key (idPermisos)
)
type = InnoDB;

/*==============================================================*/
/* Table: permisos_rol                                          */
/*==============================================================*/
create table permisos_rol
(
   idRol                int,
   idPermisos           int,
   PRFecha              timestamp,
   PRActualizado        timestamp
)
type = InnoDB;

/*==============================================================*/
/* Table: persona                                               */
/*==============================================================*/
create table persona
(
   idPersona            int not null,
   personaIdentificacion varchar(35),
   personaTipo          varchar(5),
   personaDireccion     varchar(250),
   personaTelefono      varchar(35),
   personaCorreo        varchar(100),
   personaFecha         datetime,
   personaActualizado   datetime,
   personaVigencia      boolean,
   primary key (idPersona)
);

/*==============================================================*/
/* Table: persona_paciente                                      */
/*==============================================================*/
create table persona_paciente
(
   id_persona           int,
   idPaciente           int(11)
);

/*==============================================================*/
/* Table: plan                                                  */
/*==============================================================*/
create table plan
(
   idPlan               int not null,
   planNombre           varchar(150),
   planDescripcion      text,
   planValor1           decimal(2,2),
   planValor2           decimal(2,2),
   planPorcentaje       decimal(2,2),
   planFecha            timestamp,
   planActualizado      timestamp,
   planFechaFin         timestamp,
   planVigencia         boolean,
   primary key (idPlan)
)
type = InnoDB;

alter table plan comment 'plan de seguro';

/*==============================================================*/
/* Table: plan_prestacion                                       */
/*==============================================================*/
create table plan_prestacion
(
   idPlanPrestacion     int not null,
   idPlan               int not null,
   idPrestacion         int,
   planprestacionValor  decimal(10,4),
   planprestacionCopago decimal(10,4),
   planprestacionPorcentaje decimal(10,4),
   planprestacionFecha  datetime,
   planprestacionVigencia datetime,
   planprestacionActivo boolean,
   primary key (idPlanPrestacion)
);

/*==============================================================*/
/* Table: planes                                                */
/*==============================================================*/
create table planes
(
   idPlanes             int not null,
   planesNombre         varchar(150),
   planesDescripcion    varchar(250),
   planesFecha          datetime,
   planesVigencia       datetime,
   planesActivo         boolean,
   primary key (idPlanes)
);

alter table planes comment 'Medicina Ocupacional';

/*==============================================================*/
/* Table: planes_grupo                                          */
/*==============================================================*/
create table planes_grupo
(
   idPlanesGrupo        int not null,
   idPlanes             int,
   idInstitucion        int,
   primary key (idPlanesGrupo)
);

/*==============================================================*/
/* Table: planes_servicio                                       */
/*==============================================================*/
create table planes_servicio
(
   idPlanesServicio     int not null,
   idServicio           int not null,
   idPlanes             int not null,
   planesservicioFecha  datetime,
   planesservicioVigencia datetime,
   planesservicioActivo boolean,
   primary key (idPlanesServicio)
);

/*==============================================================*/
/* Table: prestacion                                            */
/*==============================================================*/
create table prestacion
(
   idPrestacion         int not null,
   prestacionCodigo     varchar(10),
   prestacionNombre     varchar(150),
   prestacionDetalle    text,
   prestacionValor      decimal(15,4),
   prestacionValor2     decimal(15,4),
   prestacionFecha      datetime,
   prestacionVigencia   datetime,
   primary key (idPrestacion)
);

/*==============================================================*/
/* Table: prestaciones_seguro                                   */
/*==============================================================*/
create table prestaciones_seguro
(
   idPlanPrestacion     int,
   idPaciente           int(11),
   idPrestacion         int,
   idUsuario            int(10),
   idFactura            int,
   prestacionesseguroFecha datetime
);

/*==============================================================*/
/* Table: producto                                              */
/*==============================================================*/
create table producto
(
   idProducto           int not null,
   idPrestacion         int,
   productoDetalle      varchar(250),
   productoFecha        datetime,
   productoActualizado  datetime,
   productoVigencia     boolean,
   primary key (idProducto)
);

/*==============================================================*/
/* Table: provincia                                             */
/*==============================================================*/
create table provincia
(
   idProvincia          int not null,
   idPais               int,
   provinciaNombre      varchar(150),
   provinciaCodigo      varchar(5),
   provinciaDescripcion varchar(250),
   provinciaFecha       datetime,
   provinciaVigencia    boolean,
   primary key (idProvincia)
)
type = InnoDB;

/*==============================================================*/
/* Table: residencia                                            */
/*==============================================================*/
create table residencia
(
   idResidencia         varchar(5) not null,
   residenciaDescripcion varchar(200),
   primary key (idResidencia),
   unique key residenciaDescripcion (residenciaDescripcion)
)
type = InnoDB;

/*==============================================================*/
/* Table: rol                                                   */
/*==============================================================*/
create table rol
(
   idRol                int not null,
   rolNombre            varchar(150),
   rolDescripcion       text,
   rolFecha             timestamp,
   rolActualizado       timestamp,
   rolVigencia          boolean,
   primary key (idRol)
)
type = InnoDB;

alter table rol comment 'descripción de roles';

/*==============================================================*/
/* Table: seguro                                                */
/*==============================================================*/
create table seguro
(
   idSeguro             int not null,
   seguroCodigo         varchar(8),
   seguroNombre         varchar(150),
   seguroDescripcion    text,
   seguroFecha          datetime,
   seguroVigencia       datetime,
   seguroActivo         boolean,
   primary key (idSeguro)
)
type = InnoDB;

/*==============================================================*/
/* Table: seguro_plan                                           */
/*==============================================================*/
create table seguro_plan
(
   idSeguroPlan         int not null,
   idPlan               int,
   idSeguro             int,
   primary key (idSeguroPlan)
)
type = InnoDB;

/*==============================================================*/
/* Table: servicio                                              */
/*==============================================================*/
create table servicio
(
   idServicio           int not null,
   servicioCodigo       varchar(5),
   servicioNombre       varchar(150),
   servicioDescripcion  varchar(250),
   servicioTexto        text,
   servicioImagen       varchar(200),
   servicioFecha        datetime,
   servicioVigencia     datetime,
   servicioActivo       boolean,
   primary key (idServicio)
);

/*==============================================================*/
/* Table: tarifario                                             */
/*==============================================================*/
create table tarifario
(
   
);

/*==============================================================*/
/* Table: usuario                                               */
/*==============================================================*/
create table usuario
(
   idUsuario            int(10) unsigned not null auto_increment,
   idCiudad             bigint,
   idResidencia         varchar(5),
   usuarioNombre        varchar(150),
   usuarioApellido      varchar(250),
   usuarioUser          varchar(15),
   usuarioPass          varchar(100),
   usuarioDireccion     varchar(250),
   usuarioCiudad        varchar(20),
   usuarioDireccion2    varchar(250),
   usuarioTelefono      varchar(50),
   usuarioTelefono2     varchar(50),
   usuarioCelular       varchar(50),
   usuarioID            varchar(50),
   usuarioCorreo        varchar(100),
   usuarioCorreo2       varchar(100),
   usuarioTitulo        varchar(10),
   usuarioNota          varchar(250),
   usuarioImagen        longblob comment 'Logo o imagen mÃ©dico',
   usuarioFecha         timestamp,
   usuarioActualizado   timestamp,
   usuarioVigencia      boolean,
   primary key (idUsuario),
   key usuarioNombre (usuarioNombre)
)
type = InnoDB;

/*==============================================================*/
/* Table: usuario_institucion                                   */
/*==============================================================*/
create table usuario_institucion
(
   idInstitucion        int,
   idUsuario            int(10)
)
type = InnoDB;

/*==============================================================*/
/* Table: usuario_rol                                           */
/*==============================================================*/
create table usuario_rol
(
   idUsuario            int(10) not null,
   idRol                int not null,
   URFecha              timestamp,
   URActualizado        timestamp
)
type = InnoDB;

alter table broker add constraint FK_BROKER_PERSONA foreign key (idPersona)
      references persona (idPersona) on delete restrict on update restrict;

alter table campo_cd add constraint FK_PACIENTE_CAMPOCD foreign key (idPaciente)
      references paciente (idPaciente) on delete restrict on update restrict;

alter table campo_cd add constraint FK_REFERENCE_11 foreign key (CDID)
      references caracteristica_dato (CDID) on delete restrict on update restrict;

alter table caracteristica_dato add constraint FK_REFERENCE_12 foreign key (IDcaracteristica)
      references caracteristica (IDcaracteristica) on delete restrict on update restrict;

alter table certificado add constraint FK_REFERENCE_59 foreign key (idPaciente)
      references paciente (idPaciente) on delete restrict on update restrict;

alter table ciudad add constraint FK_CIUDAD_PROVINCIA foreign key (idProvincia)
      references provincia (idProvincia) on delete restrict on update restrict;

alter table consulta add constraint FK_CONSULTA_PACIENTE foreign key (idPaciente)
      references paciente (idPaciente) on delete restrict on update restrict;

alter table consulta add constraint FK_CONSULTA_USUARIO foreign key (idUsuario)
      references usuario (idUsuario) on delete restrict on update restrict;

alter table descripcion add constraint FK_PACIENTE_DESCRIPCION foreign key (idPaciente)
      references paciente (idPaciente) on delete restrict on update restrict;

alter table detalle add constraint FK_DETALLE_IMPUESTO foreign key (idImpuesto)
      references impuesto (idImpuesto) on delete restrict on update restrict;

alter table detalle add constraint FK_DETALLE_PRODUCTO foreign key (idProducto)
      references producto (idProducto) on delete restrict on update restrict;

alter table diagnostico add constraint FK_DIAGNOSTICO_DIAGNOSTICOCAT foreign key (categoriaCodigos)
      references diagnostico_cat (idCategoria) on delete restrict on update restrict;

alter table direccion add constraint FK_DIRECCION_RESIDENCIA foreign key (idResidencia)
      references residencia (idResidencia) on delete restrict on update restrict;

alter table direccion add constraint FK_PACIENTE_DIRECCION foreign key (idPaciente)
      references paciente (idPaciente) on delete restrict on update restrict;

alter table direccion add constraint FK_REFERENCE_56 foreign key (idUsuario)
      references usuario (idUsuario) on delete restrict on update restrict;

alter table direccion add constraint FK_REFERENCE_57 foreign key (idPersona)
      references persona (idPersona) on delete restrict on update restrict;

alter table factura add constraint FK_FACTURA_PERSONA foreign key (id_persona)
      references persona (idPersona) on delete restrict on update restrict;

alter table paciente add constraint FK_PACIENTE_CIUDAD foreign key ()
      references ciudad (idCiudad) on delete restrict on update restrict;

alter table paciente add constraint FK_PACIENTE_CLASESOCIAL foreign key (idClaseSocial)
      references clasesocial (idClaseSocial) on delete restrict on update restrict;

alter table paciente add constraint FK_PACIENTE_ESTADOCIVIL foreign key (idEstadoCivil)
      references estadocivil (idEstadoCivil) on delete restrict on update restrict;

alter table paciente add constraint FK_PACIENTE_GENERO foreign key (idGenero)
      references genero (idGenero) on delete restrict on update restrict;

alter table paciente add constraint FK_PACIENTE_GRUPOEDAD foreign key (idEdad)
      references grupoedad (idEdad) on delete restrict on update restrict;

alter table paciente add constraint FK_PACIENTE_INSTRUCCION foreign key (idInstruccion)
      references instruccion (idInstruccion) on delete restrict on update restrict;

alter table paciente add constraint FK_REFERENCE_58 foreign key (idEtnia)
      references etnia (idEtnia) on delete restrict on update restrict;

alter table paciente_diagnostico add constraint FK_DIAGNOSTICO_PACIENTEDIAGNOSTICO foreign key (idDiagnostico)
      references diagnostico (idDiagnostico) on delete restrict on update restrict;

alter table paciente_diagnostico add constraint FK_PACIENTE_PACIENTEDIAGNOSTICO foreign key (idPaciente)
      references paciente (idPaciente) on delete restrict on update restrict;

alter table paciente_diagnostico add constraint FK_USUARIO_PACIENTEDIAGNOSTICO foreign key (idUsuario)
      references usuario (idUsuario) on delete restrict on update restrict;

alter table paciente_pg add constraint FK_PACIENTE_PACIENTEPG foreign key (idPaciente)
      references paciente (idPaciente) on delete restrict on update restrict;

alter table paciente_pg add constraint FK_PACIENTE_PG_PLANES_GRUPO foreign key (idPlanesGrupo)
      references planes_grupo (idPlanesGrupo) on delete restrict on update restrict;

alter table paciente_plan add constraint FK_PACIENTE_PACIENTEPLAN foreign key (idPaciente)
      references paciente (idPaciente) on delete restrict on update restrict;

alter table paciente_plan add constraint FK_REFERENCE_36 foreign key (idSeguroPlan)
      references seguro_plan (idSeguroPlan) on delete restrict on update restrict;

alter table paciente_plan add constraint FK_REFERENCE_60 foreign key (idBroker)
      references broker (idBroker) on delete restrict on update restrict;

alter table pedidos add constraint FK_PACIENTE_PEDIDOS foreign key (idPaciente)
      references paciente (idPaciente) on delete restrict on update restrict;

alter table permisos add constraint FK_PERMISOS_MENU foreign key (idMenu)
      references menu (idMenu) on delete restrict on update restrict;

alter table permisos_rol add constraint FK_PERMISOS_PERMISOSROL foreign key (idPermisos)
      references permisos (idPermisos) on delete restrict on update restrict;

alter table permisos_rol add constraint FK_ROL_PERMISOSROL foreign key (idRol)
      references rol (idRol) on delete restrict on update restrict;

alter table persona_paciente add constraint FK_PACIENTE_PERSONAPACIENTE foreign key (idPaciente)
      references paciente (idPaciente) on delete restrict on update restrict;

alter table persona_paciente add constraint FK_PERSONA_PERSONAPACIENTE foreign key (id_persona)
      references persona (idPersona) on delete restrict on update restrict;

alter table plan_prestacion add constraint FK_REFERENCE_49 foreign key (idPlan)
      references plan (idPlan) on delete restrict on update restrict;

alter table plan_prestacion add constraint FK_REFERENCE_50 foreign key (idPrestacion)
      references prestacion (idPrestacion) on delete restrict on update restrict;

alter table planes_grupo add constraint FK_INSTITUCION_PLANESGRUPO foreign key (idInstitucion)
      references institucion (idInstitucion) on delete restrict on update restrict;

alter table planes_grupo add constraint FK_PLANES_GRUPO_PLANES foreign key (idPlanes)
      references planes (idPlanes) on delete restrict on update restrict;

alter table planes_servicio add constraint FK_PLANES_PLANESSERVICIO foreign key (idPlanes)
      references planes (idPlanes) on delete restrict on update restrict;

alter table planes_servicio add constraint FK_REFERENCE_40 foreign key (idServicio)
      references servicio (idServicio) on delete restrict on update restrict;

alter table prestaciones_seguro add constraint FK_PACIENTE_PRESTACIONESSEGURO foreign key (idPaciente)
      references paciente (idPaciente) on delete restrict on update restrict;

alter table prestaciones_seguro add constraint FK_PLANPRESTACION_PRESTACIONESSEGURO foreign key (idPlanPrestacion)
      references plan_prestacion (idPlanPrestacion) on delete restrict on update restrict;

alter table prestaciones_seguro add constraint FK_PRESTACION_PRESTACIONESSE4GURO foreign key (idPrestacion)
      references prestacion (idPrestacion) on delete restrict on update restrict;

alter table prestaciones_seguro add constraint FK_REFERENCE_54 foreign key (idFactura)
      references factura (idFactura) on delete restrict on update restrict;

alter table prestaciones_seguro add constraint FK_USUARIO_PRESTACIONESSEGURO foreign key (idUsuario)
      references usuario (idUsuario) on delete restrict on update restrict;

alter table producto add constraint FK_PRODUCTO_PRESTACION foreign key (idPrestacion)
      references prestacion (idPrestacion) on delete restrict on update restrict;

alter table provincia add constraint FK_PAIS_PROVINCIA foreign key (idPais)
      references pais (idPais) on delete restrict on update restrict;

alter table seguro_plan add constraint FK_REFERENCE_32 foreign key (idPlan)
      references plan (idPlan) on delete restrict on update restrict;

alter table seguro_plan add constraint FK_REFERENCE_33 foreign key (idSeguro)
      references seguro (idSeguro) on delete restrict on update restrict;

alter table usuario add constraint FK_USUARIO_CIUDAD foreign key (idCiudad)
      references ciudad (idCiudad) on delete restrict on update restrict;

alter table usuario add constraint FK_USUARIO_RESIDENCIA foreign key (idResidencia)
      references residencia (idResidencia) on delete restrict on update restrict;

alter table usuario_institucion add constraint FK_USUARIO_INSTITUCION_INSTITUCION foreign key (idInstitucion)
      references institucion (idInstitucion) on delete restrict on update restrict;

alter table usuario_institucion add constraint FK_USUARIO_INSTITUCION_USUARIO foreign key (idUsuario)
      references usuario (idUsuario) on delete restrict on update restrict;

alter table usuario_rol add constraint FK_ROL_USUARIOROL foreign key (idRol)
      references rol (idRol) on delete restrict on update restrict;

alter table usuario_rol add constraint FK_USUARIO_ROL_USUARIO foreign key (idUsuario)
      references usuario (idUsuario) on delete restrict on update restrict;

