Create database BDIntsMetaWill
go
create table  TCursos
(
c_idcurso int,
c_idmodulo int,
c_idtemario int,
c_nombrecurso varchar(max),
c_descricioncurso varchar(max),
c_inicio datetime,
c_duracion int,
c_horas int,
c_costo float
)
go

create table  T_DetCursos
(
c_iddetcurso int,
c_idcurso int,
c_idhorario int
)

create table T_horario
(
c_idhorario int,
c_dias varchar(max),
c_horario varchar(max)
)

create table T_temario
(
c_idtemario int,
c_descripcion varchar(max)
)

create table T_Detalletemario
(
c_iddettemario int,
c_idtemario int,
c_descripcion varchar(max)
)

create table T_DatosContacto(
c_iddato int,
c_nro int,
c_correo varchar(max),
c_ubicacion varchar(max)
)

create table T_Docente(
c_iddocente int,
c_nombredocente varchar(max)
)

create table T_PreguntasFrecuentes
(
c_idpregunta int,
c_pregunta varchar(max),
c_respuesta varchar(max)
)
go