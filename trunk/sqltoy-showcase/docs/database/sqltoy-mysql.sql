/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017/3/20 15:25:57                           */
/*==============================================================*/


drop table if exists SAG_DICT_DETAIL;

drop index IDX_SAG_DICTTYPE_NAME on SAG_DICT_TYPE;

drop table if exists SAG_DICT_TYPE;

drop table if exists SYS_AREA_CODE;

drop table if exists SYS_BIG_LOB;

drop table if exists SYS_MULTPK_ITEM;

drop table if exists SYS_MULTPK_MAIN;

drop index IDX_ORGAN_NODE_ROUTE on SYS_ORGAN_INFO;

drop table if exists SYS_ORGAN_INFO;

drop table if exists SYS_SHARDING_HIS;

drop table if exists SYS_SHARDING_REAL;

drop index IDX_STAFF_ORGAN on SYS_STAFF_INFO;

drop table if exists SYS_STAFF_INFO;

drop table if exists SYS_SUMMARY_CASE;

drop table if exists SYS_UNPIVOT_DATA;

/*==============================================================*/
/* Table: SAG_DICT_DETAIL                                       */
/*==============================================================*/
create table SAG_DICT_DETAIL
(
   DICT_TYPE_CODE       varchar(50) not null comment '�ֵ����ͱ���',
   DICT_KEY             varchar(100) not null comment '�ֵ�KEY(�ֵ����)',
   DICT_NAME            varchar(100) not null comment '�ֵ���ʾֵ(��ʾ������)',
   SHOW_INDEX           decimal(8) not null comment '��ʾ˳��',
   COMMENTS             varchar(1000) comment '�ֵ�����',
   SEGMENT              varchar(100) comment '�����ֶ�',
   UPDATE_BY            varchar(22) not null comment '����޸���',
   UPDATE_TIME          TIMESTAMP not null comment '����޸�ʱ��',
   STATUS               char(1) not null default '1' comment '���ñ�־',
   primary key (DICT_KEY, DICT_TYPE_CODE)
);

alter table SAG_DICT_DETAIL comment '�����ֵ���ϸ��';

/*==============================================================*/
/* Table: SAG_DICT_TYPE                                         */
/*==============================================================*/
create table SAG_DICT_TYPE
(
   DICT_TYPE_CODE       varchar(50) not null comment '�ֵ����ͱ���',
   DICT_TYPE_NAME       varchar(100) not null comment '�ֵ���������',
   COMMENTS             varchar(500) comment '�ֵ���������',
   DATA_SIZE            decimal(4) comment '�ֵ�KEY���ݳ���',
   DATA_TYPE            decimal(1) not null default 0 comment '�ֵ�KEY��������',
   OPERATOR             varchar(22) comment '�޸���',
   OPERATE_DATE         date comment '�޸�����',
   SEGMENT_NAME         varchar(100) comment '��չ����1����',
   SEGMENT_DICT_TYPE    varchar(50) comment '��չ������Դ�ֵ�',
   STATUS               char(1) not null default '1' comment '���ñ�־',
   primary key (DICT_TYPE_CODE)
);

alter table SAG_DICT_TYPE comment '�����ֵ�����';

/*==============================================================*/
/* Index: IDX_SAG_DICTTYPE_NAME                                 */
/*==============================================================*/
create unique index IDX_SAG_DICTTYPE_NAME on SAG_DICT_TYPE
(
   DICT_TYPE_NAME
);

/*==============================================================*/
/* Table: SYS_AREA_CODE                                         */
/*==============================================================*/
create table SYS_AREA_CODE
(
   AREA_CODE            varchar(6) not null comment '������',
   AREA_NAME            varchar(40) not null comment '��������',
   CITY_CODE            varchar(6) comment '���д���',
   CITY_NAME            varchar(30) comment '��������',
   PROVINCE_CODE        varchar(6) comment 'ʡ�ݴ���',
   PROVINCE_NAME        varchar(30) comment 'ʡ������',
   SHOW_INDEX           integer not null comment '��ʾ˳��',
   STATUS               char(1) not null default '1' comment '���ñ�־',
   primary key (AREA_CODE)
);

alter table SYS_AREA_CODE comment '���������';

/*==============================================================*/
/* Table: SYS_BIG_LOB                                           */
/*==============================================================*/
create table SYS_BIG_LOB
(
   ID                   int not null auto_increment comment '����',
   STAFF_NAME           VARCHAR(30) comment 'Ա������',
   CREATE_DATE          date not null comment '��������',
   COMMENTS             text comment '˵��',
   STAFF_PHOTO          longblob comment 'Ա����Ƭ',
   primary key (ID)
);

alter table SYS_BIG_LOB comment '���������ʹ洢';

/*==============================================================*/
/* Table: SYS_MULTPK_ITEM                                       */
/*==============================================================*/
create table SYS_MULTPK_ITEM
(
   GOODS_NO             varchar(20) not null comment '��Ʒ���',
   BIZ_TYPE             varchar(20) comment 'ҵ�������',
   BATCH_NO             varchar(10) comment '���κ�',
   QUANTITY             decimal(4) not null comment '��Ʒ����',
   PRICE                decimal(6,2) not null comment '����',
   primary key (GOODS_NO)
);

alter table SYS_MULTPK_ITEM comment '�������������ӱ�';

/*==============================================================*/
/* Table: SYS_MULTPK_MAIN                                       */
/*==============================================================*/
create table SYS_MULTPK_MAIN
(
   BIZ_TYPE             varchar(20) not null comment 'ҵ�������',
   BATCH_NO             varchar(10) not null comment '���κ�',
   AMOUNT               decimal(12,2) not null comment '���׽��',
   CREATE_TIME          date not null comment '��������',
   primary key (BIZ_TYPE, BATCH_NO)
);

alter table SYS_MULTPK_MAIN comment '����������������';

/*==============================================================*/
/* Table: SYS_ORGAN_INFO                                        */
/*==============================================================*/
create table SYS_ORGAN_INFO
(
   ORGAN_ID             VARCHAR(22) not null comment '�������',
   ORGAN_NAME           VARCHAR(100) not null comment '��������',
   ALIAS_NAME           VARCHAR(100) comment '�������',
   ORGAN_CODE           VARCHAR(60) comment '��������',
   ORGAN_PID            VARCHAR(22) comment '�ϼ�����',
   NODE_ROUTE           VARCHAR(220) comment '�ڵ�·��',
   NODE_LEVEL           decimal(2) comment '�ڵ�㼶',
   IS_LEAF              decimal(1) comment '�Ƿ�Ҷ�ӽڵ�',
   OPERATOR             VARCHAR(22) not null comment '������',
   OPERATE_DATE         DATE not null comment '��������',
   STATUS               char(1) not null default '1' comment '���ñ�־',
   primary key (ORGAN_ID)
);

alter table SYS_ORGAN_INFO comment '������Ϣ��';

/*==============================================================*/
/* Index: IDX_ORGAN_NODE_ROUTE                                  */
/*==============================================================*/
create index IDX_ORGAN_NODE_ROUTE on SYS_ORGAN_INFO
(
   NODE_ROUTE
);

/*==============================================================*/
/* Table: SYS_SHARDING_HIS                                      */
/*==============================================================*/
create table SYS_SHARDING_HIS
(
   ID                   decimal(22) not null comment '���',
   STAFF_ID             varchar(30) not null comment 'Ա������',
   POST_TYPE            varchar(30) comment '��λ���',
   CREATE_TIME          datetime not null comment '����ʱ��',
   COMMENTS             varchar(1000) comment '˵��',
   primary key (ID)
);

alter table SYS_SHARDING_HIS comment '��Ƭ������ʷ��';

/*==============================================================*/
/* Table: SYS_SHARDING_REAL                                     */
/*==============================================================*/
create table SYS_SHARDING_REAL
(
   ID                   decimal(22) not null comment '���',
   STAFF_ID             varchar(30) not null comment 'Ա������',
   POST_TYPE            varchar(30) comment '��λ���',
   CREATE_TIME          datetime not null comment '����ʱ��',
   COMMENTS             varchar(1000) comment '˵��',
   primary key (ID)
);

alter table SYS_SHARDING_REAL comment '��Ƭ����ʵʱ��';

/*==============================================================*/
/* Table: SYS_STAFF_INFO                                        */
/*==============================================================*/
create table SYS_STAFF_INFO
(
   STAFF_ID             VARCHAR(22) not null comment 'Ա��ID',
   STAFF_CODE           VARCHAR(22) not null comment 'Ա������',
   ORGAN_ID             VARCHAR(22) not null comment '�������',
   STAFF_NAME           VARCHAR(60) not null comment 'Ա������',
   SEX_TYPE             CHAR(1) comment 'DD�Ա�',
   MOBILE_TEL           VARCHAR(15) comment '��ϵ�绰',
   BIRTHDAY             DATE comment '��������',
   DUTY_DATE            DATE comment '��ְ����',
   OUT_DUTY_DATE        DATE comment '��ְ����',
   POST                 VARCHAR(6) comment 'DD��λ',
   NATIVE_PLACE         varchar(10) comment '����',
   EMAIL                VARCHAR(100) comment '�����ַ',
   OPERATOR             VARCHAR(22) not null comment '������',
   OPERATE_DATE         DATE not null comment '��������',
   STATUS               char(1) not null default '1' comment '���ñ�־',
   primary key (STAFF_ID)
);

alter table SYS_STAFF_INFO comment 'Ա����Ϣ��';

/*==============================================================*/
/* Index: IDX_STAFF_ORGAN                                       */
/*==============================================================*/
create index IDX_STAFF_ORGAN on SYS_STAFF_INFO
(
   ORGAN_ID
);

/*==============================================================*/
/* Table: SYS_SUMMARY_CASE                                      */
/*==============================================================*/
create table SYS_SUMMARY_CASE
(
   TRANS_ID             varchar(22) not null comment '������ˮ��',
   TRANS_DATE           date not null comment '��������',
   TRANS_CHANNEL        varchar(20) not null comment '��������',
   TRANS_CODE           varchar(20) comment '���״���',
   TRANS_AMT            decimal(12,2) not null comment '���׽��',
   primary key (TRANS_ID)
);

alter table SYS_SUMMARY_CASE comment '���ܼ�����ʾ��';

/*==============================================================*/
/* Table: SYS_UNPIVOT_DATA                                      */
/*==============================================================*/
create table SYS_UNPIVOT_DATA
(
   TRANS_DATE           date not null comment '��������',
   TOTAL_AMOUNT         decimal(10,2) not null comment '�����ܽ��',
   PERSON_AMOUNT        decimal(10,2) not null comment '���˽��׽��',
   COMPANY_AMOUNT       decimal(10,2) not null comment '��ҵ���׽��',
   primary key (TRANS_DATE)
);

alter table SYS_UNPIVOT_DATA comment '��ת�в���';

alter table SAG_DICT_DETAIL add constraint FK_DICT_REF_TYPE foreign key (DICT_TYPE_CODE)
      references SAG_DICT_TYPE (DICT_TYPE_CODE) on delete cascade on update restrict;

alter table SYS_MULTPK_ITEM add constraint FK_SAG_ITEM_REF_MAIN foreign key (BIZ_TYPE, BATCH_NO)
      references SYS_MULTPK_MAIN (BIZ_TYPE, BATCH_NO) on delete cascade on update restrict;

