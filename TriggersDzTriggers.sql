use SportShop
--1
create trigger insHistory
on Sales
for insert
as
begin
	declare @count int = (select CountOfGoodsInStock from Goods
				where Id = (select GoodsId from inserted))
	if(@count >= (select [Count] from inserted))
	begin
		insert into History(GoodsId,SellerId,ClientId,[Count],Date)
		values ((select GoodsId from inserted),
				(select SellerId from inserted),
				(select ClientId from inserted),
				(select [Count] from inserted),
				GETDATE())
		update Goods set CountOfGoodsInStock = 
		CountOfGoodsInStock-(select [Count] from inserted)
		where Id = (select GoodsId from inserted)
	end
	else
		rollback transaction
End

--2

create trigger insArhive
on Goods
for update 
as
begin 
	if((select CountOfGoodsInStock from inserted) = 0)
	begin
		insert into Archiv(Name,Price,CostPrice,ManufacturerId,TypeGoodsId)
		values((select Name from inserted),
			   (select Price from inserted),
			   (select CostPrice from inserted),
			   (select ManufacturerId from inserted),
			   (select TypeGoodsId from inserted))
	end
end

--3

create trigger checkClient
on Client
for insert
as
begin
	declare @count int

	select @count = COUNT(*) 
	from Client
	where Name = (select Name from inserted) and
	Surname = (select Surname from inserted) and
	LastName = (select LastName from inserted) and
	Email = (select Email from inserted)

	if(@count > 1)
	begin
		rollback transaction
		print('Данные о таком клиенте уже существуют')
	end
	else
	begin
		print('Данные успешно занесены в базу данных')
	end
end

--4

create trigger notDelClient
on Client
for delete
as 
begin
	rollback transaction
	print('Запрещено удалять клиентов из базы данных')
end

--5

create trigger notDelSellersBefore2015
on Seller
for delete
as
begin
	declare @date date = (select StartWorkDate from deleted)
	declare @compareDat date = '2015-01-01'
	if( @date < @compareDat)
	begin
		rollback transaction 
		print('Нельзя удалять работников принятых до 2015 года')
	end
end

--6

create trigger discountForClient
on Sales
for insert
as
begin
	declare @sum int = (select Count from inserted)
	* (select Price from Goods where Id = (select GoodsId from inserted))
	if(@sum > 50000)
	begin
		update Client set Discount = 15
		where Id = (select ClientId from inserted)
	end
end

--7

create trigger notInsertGoodsOfFilrm
on Goods
for insert
as
begin
	declare @curentName nvarchar(max) = (select Name from Manufacturer where Id = (select ManufacturerId from inserted))
	if(@curentName = 'Спорт, солнце и штанга')
	begin
		rollback transaction
		print('Запрещено добавлять товар этой фирмы')
	end
end

--8

create trigger insLastGoods
on Sales
for insert
as
begin
	declare @countOfGoods int = (select CountOfGoodsInStock from Goods where Id = (select GoodsId from inserted)) - (select Count from inserted)
	if(@countOfGoods = 1)
	begin
		insert into LastGoods(Name,CostPrice,ManufacturerId,TypeGoodsId)
		values((select Name from Goods where Id = (select GoodsId from inserted)),
			   (select CostPrice from Goods where Id = (select GoodsId from inserted)),
			   (select ManufacturerId from Goods where Id = (select GoodsId from inserted)),
			   (select TypeGoodsId from Goods where Id = (select GoodsId from inserted)))
	end
	else
	begin
		print(@countOfGoods)
	end
end

