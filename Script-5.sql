drop function getCantBilletes;

create function getCantBilletes(deno varchar)
returns int
language plpgsql
as
$$
declare
   cant integer default 0;
begin
   select cantidad
   into cant
   from billetes
  	where denominacion = deno;  
   return cant;
end;
$$;

select getCantBilletes('10K');