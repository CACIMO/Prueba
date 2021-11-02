
create procedure retirar(
	retiro int
)
language plpgsql
as
$$
declare
   	billetes10 integer default 0;
   	billetes20 integer default 0;
   	billetes50 integer default 0;
   	billetes100 integer default 0;
	restante integer default 0;
	dividendo integer default 0;
	codeTrans varchar;
begin
   	begin
		SELECT MD5(random()::text)
		into codeTrans;   	
	end;
	restante := retiro;
	
	begin
		select restante/100000 
		into dividendo;
	end;

	if dividendo > 0 then
		billetes100 := dividendo;
		restante := restante-billetesDisp('100K',dividendo)*100000;
		
	end if;

	if restante > 0 then
		
		begin
			select restante/50000 
			into dividendo;
		end;
	
		if dividendo > 0 then
			billetes50:= dividendo;
			restante := restante-billetesDisp('50K',dividendo)*50000;
		end if;
	
	end if;

	if restante > 0 then
		begin
			select restante/20000 
			into dividendo;
		end;
	
		if dividendo > 0 then
			billetes20:= dividendo;
			restante := restante-billetesDisp('20K',dividendo)*20000;
		end if;
	
	end if;

	if restante > 0 then
		begin
			select restante/10000 
			into dividendo;
		end;
	
		if dividendo > 0 then
			billetes10:= dividendo;
			restante := restante-billetesDisp('10K',dividendo)*10000;
		end if;
	
	end if;
	
	begin
		insert into encabezadoTrans values(codeTrans,retiro);
	end;
	begin
		insert into detalleTrans values(codeTrans,billetes10,billetes20,billetes50,billetes100);
	end;


	
	
end;
$$;