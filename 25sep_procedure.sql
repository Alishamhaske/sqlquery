use [21sep_procedure]
create procedure addproc

@a int,
@b int,
@res int output
as begin
set @res=@a+@b
end
go

declare @ans int
exec addproc @a=10,@b=20,@res=@ans output
select @ans as addtion

