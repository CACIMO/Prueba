create function getSaldo()
returns int
language plpgsql
as
$$
declare
   saldo integer default 0;
begin
   select sum(valor*cantidad)
   into saldo
   from billetes;  
   return saldo;
end;
$$;