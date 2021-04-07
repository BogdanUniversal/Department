use depozit2;

create or alter view [Transporturi la un magazin] as
select Magazine.nume_magazin, TransportMagazine.nr_livrari, Transport.cod_transport
from ((TransportMagazine
inner join Magazine on TransportMagazine.cod_magazin = Magazine.cod_magazin)
inner join Transport on TransportMagazine.cod_transport = Transport.cod_transport)

select * from [Transporturi la un magazin]


create trigger [Inserare transport]
on Transport
after INSERT
as
SELECT GETDATE() as 'Data si ora curenta', 'INSERT' as 'Tipul operatiei', 'Transport' as 'Numele tabelului'

create or alter procedure insereazaTransport2 @tip_vehicul VARCHAR(20), @tip_transport VARCHAR(20)
as
begin
insert into Transport(tip_vehicul, tip_transport) values(@tip_vehicul, @tip_transport);
end

exec insereazaTransport2 'duba', 'dulciuri';


create trigger [Stergere transport]
on Transport
after DELETE
as
SELECT GETDATE() as 'Data si ora curenta', 'DELETE' as 'Tipul operatiei', 'Transport' as 'Numele tabelului'

create or alter procedure stergeTransport @tip_vehicul varchar(20), @tip_transport varchar(20)
as
begin
delete from Transport where tip_vehicul = @tip_vehicul and tip_transport =@tip_transport;
end

exec stergeTransport 'duba','dulciuri';
