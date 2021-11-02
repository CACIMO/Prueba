create function funtionRetirar(valor int)
returns varchar
language plpgsql
as
$$
declare
begin
	
	call retirar(valor); 
	return 'Transaccion Finalizada';	
end;
$$