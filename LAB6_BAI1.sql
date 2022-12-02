----------------------BÀI 1A
create trigger Add_nv ON NHANVIEN for insert as 
if (select LUONG from inserted )<15000
begin 
print 'Lương phải >15000'
rollback transaction 
end
go
insert into NHANVIEN values (N'Nguyễn',N'Văn',N'Toàn','020',cast('1967-10-20' as date),N'230 Lê Văn Sỹ,TP HCM','Nam',30000,'010',4)
----------------------BÀI 1B
create trigger check_themnv ON NHANVIEN for insert as 
declare @tuoi int
set @tuoi=year(getdate()) - (select year(NGSINH) from inserted)
if (@tuoi < 18 or @tuoi > 65 )
begin
print'Yêu cầu nhập tuổi từ 18 đến 65'
rollback transaction 
end
go
insert into NHANVIEN values (N'Lê',N'An',N'Sơn','011',cast('1970-10-20' as date),N'200 Lê Văn Sỹ,TP HCM','Nam',300000,'011',4)
----------------------BÀI 1C
create trigger update_NV on NHANVIEN for update as
IF (SELECT DCHI FROM inserted ) like '%TP HCM%'
begin
print'Không thể cập nhật'
rollback transaction
end
update NHANVIEN SET TENNV='Như' where MANV ='001'