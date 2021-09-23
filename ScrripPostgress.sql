
/*==============================================================*/
/* Table: AREADEPORTIVA_G1                                      */
/*==============================================================*/
create table AREADEPORTIVA_G1 (
   IDAREADEPORTIVA      NUMERIC              not null,
   IDDEPORTE            NUMERIC              null,
   AREADESTINADA        NUMERIC              not null,
   IDCOMPLEJO           NUMERIC              null,
   constraint PK_AREADEPORTIVA_G1 primary key (IDAREADEPORTIVA)
);

comment on table AREADEPORTIVA_G1 is
'identifica cuanta area s esta destinando y de que tipo para cada deporte en los complejos polideportivos';

/*==============================================================*/
/* Index: AREADEPORTIVA_G1_PK                                   */
/*==============================================================*/
create unique index AREADEPORTIVA_G1_PK on AREADEPORTIVA_G1 (
IDAREADEPORTIVA
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_5_FK on AREADEPORTIVA_G1 (
IDDEPORTE
);

/*==============================================================*/
/* Table: COMISARIO_G1                                          */
/*==============================================================*/
create table COMISARIO_G1 (
   IDCOMISARIO          NUMERIC              not null,
   NOMBRECOMISARIO      VARCHAR(50)          not null,
   constraint PK_COMISARIO_G1 primary key (IDCOMISARIO)
);

comment on table COMISARIO_G1 is
'Lista a todos los comisarios para cada uno de los deportes y permite relaciona un comisario con cada deporte y cada evento deportivo';

/*==============================================================*/
/* Index: COMISARIO_G1_PK                                       */
/*==============================================================*/
create unique index COMISARIO_G1_PK on COMISARIO_G1 (
IDCOMISARIO
);

/*==============================================================*/
/* Table: COMPLEJO_G1                                           */
/*==============================================================*/
create table COMPLEJO_G1 (
   IDCOMPLEJOPK         NUMERIC              not null,
   IDSEDEPK             NUMERIC              null,
   NOMBRECOMPELJO       VARCHAR(30)          not null,
   TIPOCOMPLEJO         NUMERIC              not null,
   JEFEORGANIZACION     VARCHAR(30)          not null,
   AREATOTALOCUPADA     NUMERIC              not null,
   ES_UNIDAD_DEPORTIVA  BOOL                 null,
   NOM_UNIDAD_DEPORTIVA TEXT                 null,
   NOM_POLIDEPORTIVO    TEXT                 null,
   NOM_AREA_DEPORTIVA   NUMERIC              null,
   IDAREADEPORTIVA      NUMERIC              null,
   constraint PK_COMPLEJO_G1 primary key (IDCOMPLEJOPK)
);

comment on table COMPLEJO_G1 is
'Define el tipo de sede de la que se esta registrando, si es unideprotiva  o polideportiva con caracteristias como el area ocuapada, como un jefe de complejo';

/*==============================================================*/
/* Index: COMPLEJO_G1_PK                                        */
/*==============================================================*/
create unique index COMPLEJO_G1_PK on COMPLEJO_G1 (
IDCOMPLEJOPK
);

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_9_FK on COMPLEJO_G1 (
IDSEDEPK
);

/*==============================================================*/
/* Index: RELATIONSHIP_12_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_12_FK on COMPLEJO_G1 (
IDAREADEPORTIVA
);

/*==============================================================*/
/* Table: DEPORTE_EQUIPO_G1                                     */
/*==============================================================*/
create table DEPORTE_EQUIPO_G1 (
   IDDEPORTE            NUMERIC              not null,
   IDEQUIPO             INT4                 not null,
   IDDEPORTEEQUIPO      INT4                 not null,
   constraint PK_DEPORTE_EQUIPO_G1 primary key (IDDEPORTE, IDEQUIPO, IDDEPORTEEQUIPO)
);

/*==============================================================*/
/* Index: DEPORTE_EQUIPO_G1_PK                                  */
/*==============================================================*/
create unique index DEPORTE_EQUIPO_G1_PK on DEPORTE_EQUIPO_G1 (
IDDEPORTE,
IDEQUIPO,
IDDEPORTEEQUIPO
);

/*==============================================================*/
/* Index: RELATIONSHIP_17_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_17_FK on DEPORTE_EQUIPO_G1 (
IDEQUIPO
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_11_FK on DEPORTE_EQUIPO_G1 (
IDDEPORTE
);

/*==============================================================*/
/* Table: DEPORTE_G1                                            */
/*==============================================================*/
create table DEPORTE_G1 (
   IDDEPORTE            NUMERIC              not null,
   NOMBREDEPORTE        VARCHAR(30)          not null,
   constraint PK_DEPORTE_G1 primary key (IDDEPORTE)
);

comment on table DEPORTE_G1 is
'Tabla que conserva todos los tipos de deportes que se pueden obtener en las olimpiadas ';

/*==============================================================*/
/* Index: DEPORTE_G1_PK                                         */
/*==============================================================*/
create unique index DEPORTE_G1_PK on DEPORTE_G1 (
IDDEPORTE
);

/*==============================================================*/
/* Table: EQUIPAMIENTO_G1                                       */
/*==============================================================*/
create table EQUIPAMIENTO_G1 (
   IDEQUIPO             INT4                 not null,
   NOMBREEQUIPO         VARCHAR(50)          not null,
   DESCRIPCIONEQUIPO    VARCHAR(500)         null,
   constraint PK_EQUIPAMIENTO_G1 primary key (IDEQUIPO)
);

comment on table EQUIPAMIENTO_G1 is
'Relaciona todo los diferentes equipos delas olimpiadas y permite relaicionar aca equipo con un evento para poder realizar una distribucion de cada deporte';

/*==============================================================*/
/* Index: EQUIPAMIENTO_G1_PK                                    */
/*==============================================================*/
create unique index EQUIPAMIENTO_G1_PK on EQUIPAMIENTO_G1 (
IDEQUIPO
);

/*==============================================================*/
/* Table: EVENTOCOMISARIO_G1                                    */
/*==============================================================*/
create table EVENTOCOMISARIO_G1 (
   IDEVENTOCOMISARIO    NUMERIC              not null,
   IDEVENTO             NUMERIC              not null,
   IDCOMISARIO          NUMERIC              not null,
   constraint PK_EVENTOCOMISARIO_G1 primary key (IDEVENTO, IDCOMISARIO, IDEVENTOCOMISARIO)
);

/*==============================================================*/
/* Index: EVENTOCOMISARIO_G1_PK                                 */
/*==============================================================*/
create unique index EVENTOCOMISARIO_G1_PK on EVENTOCOMISARIO_G1 (
IDEVENTO,
IDCOMISARIO,
IDEVENTOCOMISARIO
);

/*==============================================================*/
/* Index: RELATIONSHIP_15_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_15_FK on EVENTOCOMISARIO_G1 (
IDCOMISARIO
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_7_FK on EVENTOCOMISARIO_G1 (
IDEVENTO
);

/*==============================================================*/
/* Table: EVENTO_EQUIPO_G1                                      */
/*==============================================================*/
create table EVENTO_EQUIPO_G1 (
   IDEVENTOEQUIPO       INT4                 not null,
   IDEQUIPO             INT4                 not null,
   IDEVENTO             NUMERIC              not null,
   constraint PK_EVENTO_EQUIPO_G1 primary key (IDEVENTOEQUIPO)
);

/*==============================================================*/
/* Index: EVENTO_EQUIPO_G1_PK                                   */
/*==============================================================*/
create unique index EVENTO_EQUIPO_G1_PK on EVENTO_EQUIPO_G1 (
IDEVENTOEQUIPO
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_8_FK on EVENTO_EQUIPO_G1 (
IDEQUIPO
);

/*==============================================================*/
/* Index: RELATIONSHIP_16_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_16_FK on EVENTO_EQUIPO_G1 (
IDEVENTO
);

/*==============================================================*/
/* Table: EVENTO_G1                                             */
/*==============================================================*/
create table EVENTO_G1 (
   IDEVENTO             NUMERIC              not null,
   IDCOMPLEJOPK         NUMERIC              null,
   NOMBREEVENTO         VARCHAR(30)          null,
   DURACION             INT4                 null,
   FECHAEVENTO          DATE                 not null,
   NUNPARTICIPANTES     INT4                 null,
   constraint PK_EVENTO_G1 primary key (IDEVENTO)
);

comment on table EVENTO_G1 is
'Registra cada uno de los eventos deportivos y permite realcionar acada evento con un deporte y con un comisario, de igual manera si se requiere ';

/*==============================================================*/
/* Index: EVENTO_G1_PK                                          */
/*==============================================================*/
create unique index EVENTO_G1_PK on EVENTO_G1 (
IDEVENTO
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_10_FK on EVENTO_G1 (
IDCOMPLEJOPK
);

/*==============================================================*/
/* Table: SEDE_G1                                               */
/*==============================================================*/
create table SEDE_G1 (
   IDSEDEPK             NUMERIC              not null,
   NOMBRESEDE           VARCHAR(30)          not null,
   PRESUPUESTO          MONEY                not null,
   constraint PK_SEDE_G1 primary key (IDSEDEPK)
);

comment on table SEDE_G1 is
'Describe  las caracteristicas de cada sede  tanto cen su presupuesto como su nombre';

/*==============================================================*/
/* Index: SEDE_G1_PK                                            */
/*==============================================================*/
create unique index SEDE_G1_PK on SEDE_G1 (
IDSEDEPK
);

alter table AREADEPORTIVA_G1
   add constraint FK_AREADEPO_RELATIONS_DEPORTE_ foreign key (IDDEPORTE)
      references DEPORTE_G1 (IDDEPORTE)
      on delete restrict on update restrict;

alter table COMPLEJO_G1
   add constraint FK_COMPLEJO_RELATIONS_AREADEPO foreign key (IDAREADEPORTIVA)
      references AREADEPORTIVA_G1 (IDAREADEPORTIVA)
      on delete restrict on update restrict;

alter table COMPLEJO_G1
   add constraint FK_COMPLEJO_RELATIONS_SEDE_G1 foreign key (IDSEDEPK)
      references SEDE_G1 (IDSEDEPK)
      on delete restrict on update restrict;

alter table DEPORTE_EQUIPO_G1
   add constraint FK_DEPORTE__RELATIONS_DEPORTE_ foreign key (IDDEPORTE)
      references DEPORTE_G1 (IDDEPORTE)
      on delete restrict on update restrict;

alter table DEPORTE_EQUIPO_G1
   add constraint FK_DEPORTE__RELATIONS_EQUIPAMI foreign key (IDEQUIPO)
      references EQUIPAMIENTO_G1 (IDEQUIPO)
      on delete restrict on update restrict;

alter table EVENTOCOMISARIO_G1
   add constraint FK_EVENTOCO_RELATIONS_COMISARI foreign key (IDCOMISARIO)
      references COMISARIO_G1 (IDCOMISARIO)
      on delete restrict on update restrict;

alter table EVENTOCOMISARIO_G1
   add constraint FK_EVENTOCO_RELATIONS_EVENTO_G foreign key (IDEVENTO)
      references EVENTO_G1 (IDEVENTO)
      on delete restrict on update restrict;

alter table EVENTO_EQUIPO_G1
   add constraint FK_EVENTO_E_RELATIONS_EVENTO_G foreign key (IDEVENTO)
      references EVENTO_G1 (IDEVENTO)
      on delete restrict on update restrict;

alter table EVENTO_EQUIPO_G1
   add constraint FK_EVENTO_E_RELATIONS_EQUIPAMI foreign key (IDEQUIPO)
      references EQUIPAMIENTO_G1 (IDEQUIPO)
      on delete restrict on update restrict;

alter table EVENTO_G1
   add constraint FK_EVENTO_G_RELATIONS_COMPLEJO foreign key (IDCOMPLEJOPK)
      references COMPLEJO_G1 (IDCOMPLEJOPK)
      on delete restrict on update restrict;

