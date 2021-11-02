drop function billetesDisp;
create function billetesDisp(deno varchar, cant int)
returns int
language plpgsql
as
$$
declare
	disponibles int default 0;
begin
	begin
		select cantidad
		into disponibles
		from billetes
		where denominacion = deno;
	end;

	if disponibles >= cant then
		disponibles:= cant;
	end if;

	begin
		update billetes 
		set cantidad  = cantidad - disponibles
		where denominacion = deno;
	end;

	return disponibles;
	
end;
$$