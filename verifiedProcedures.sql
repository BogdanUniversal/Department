use depozit2;

create or alter function verificaInserareTransport(@tip_vehicul VARCHAR(20), @tip_transport VARCHAR(20))
returns int as
begin
declare @ok int;
set @ok=0;
if len(@tip_vehicul)=0 or len(@tip_transport)=0
	begin
	set @ok = 0;
	end
else
	begin
	set @ok =1;
	end
return @ok
end

create or alter procedure insereazaTransport @tip_vehicul VARCHAR(20), @tip_transport VARCHAR(20)
as
begin
if dbo.verificaInserareTransport(@tip_vehicul, @tip_transport) = 1
	begin
	insert into Transport(tip_vehicul, tip_transport) values(@tip_vehicul, @tip_transport);
	print 'S-a adaugat ' + @tip_vehicul + ' in tabelul Transport!';
	end
else
	begin
	print 'Datele introduse sunt gresite!';
	end
end

exec insereazaTransport 'duba','dulciuri';



create or alter function verificaInserareMagazin(@nume_magazin VARCHAR(50), @locatie_magazin VARCHAR(50))
returns int as
begin
declare @ok int;
set @ok=0;
if len(@nume_magazin)=0 or len(@locatie_magazin)=0 or CHARINDEX('nr.',@locatie_magazin)=0
	begin
	set @ok = 0;
	end
else
	begin
	set @ok =1;
	end
return @ok
end

create or alter procedure insereazaMagazin @nume_magazin VARCHAR(50), @locatie_magazin VARCHAR(50)
as
begin
if dbo.verificaInserareMagazin(@nume_magazin, @locatie_magazin) = 1
	begin
	insert into Magazine(nume_magazin, locatie_magazin) values(@nume_magazin, @locatie_magazin);
	print 'S-a adaugat ' + @nume_magazin + ' in tabelul Magazin!';
	end
else
	begin
	print 'Datele introduse sunt gresite!';
	end
end

exec insereazaMagazin 'Anabella','Calea lui Traian';



create or alter function verificaInserareTransportMagazin(@nr_livrari int)
returns int as
begin
declare @ok int;
set @ok=0;
if @nr_livrari<0 or @nr_livrari>10000
	begin
	set @ok = 0;
	end
else
	begin
	set @ok =1;
	end
return @ok
end

create or alter procedure insereazaTransportMagazin @cod_transport int, @cod_magazin int, @nr_livrari int
as
begin
if dbo.verificaInserareTransportMagazin(@nr_livrari) = 1
	begin
	insert into TransportMagazine(cod_transport, cod_magazin, nr_livrari) values(@cod_transport, @cod_magazin, @nr_livrari);
	print 'S-a adaugat transportul ' + str(@cod_transport) + ' la magazinul ' + str(@cod_magazin) + ' in tabelul TransportMagazine!';
	end
else
	begin
	print 'Datele introduse sunt gresite!';
	end
end

exec insereazaTransportMagazin 4,1002,100;