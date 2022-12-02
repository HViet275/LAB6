----------BÀI 3A
instead of delete
as
begin
delete from THANNHAN where MA_NVIEN in(select manv from deleted)
delete from NHANVIEN where manv in(select manv from deleted)
end
insert into THANNHAN values ('031', 'HOÀNG', 'TIÊN', '03-10-2017', 'con')
delete NHANVIEN where manv='031'

----------BÀI 3B
create trigger nhanvien3 on NHANVIEN
after insert 
as
begin
insert into PHANCONG values ((select manv from inserted), 1,2,20)
end
INSERT INTO NHANVIEN VALUES ('Lê','Hoàng','Việt','031','7-25-1999','Hà nội','Nam',60000,'003',1)