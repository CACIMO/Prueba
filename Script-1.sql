create table billetes (
	denominacion VARCHAR,
	valor int,
	cantidad int
)
create table detalleTrans (
codeTrans varchar,billetes10 int ,billetes20 int ,billetes50 int ,billetes100 int )

create table encabezadoTrans (
codeTrans varchar,valoraRetirar int)

insert into billetes (denominacion,valor,cantidad) values('10K',10000,20);
insert into billetes (denominacion,valor,cantidad) values('20K',20000,20);
insert into billetes (denominacion,valor,cantidad) values('50K',50000,10);
insert into billetes (denominacion,valor,cantidad) values('100K',100000,2);

