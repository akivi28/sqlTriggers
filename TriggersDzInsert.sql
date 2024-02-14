use SportShop

INSERT INTO TypeGoods(Name)
VALUES ('Одежда'),
       ('Обувь'),
       ('Спортивное снаряжение'),
       ('Защитное снаряжение')

INSERT INTO Manufacturer(Name)
VALUES ('Nike'),
       ('Adidas'),
       ('Puma'),
       ('Under Armour'),
       ('Reebok'),
	   ('Спорт, солнце и штанга')

INSERT INTO JobPosition(Name)
VALUES ('Менеджер по продажам'),
       ('Продавец-консультант'),
       ('Администратор магазина')

INSERT INTO Goods(Name,CountOfGoodsInStock,Price,CostPrice,ManufacturerId,TypeGoodsId)
VALUES  ('Футболка',100,700,500,(select id from Manufacturer where Name = 'Nike'),
								(select id from TypeGoods where Name = 'Одежда')),
		('Шотры',150,750,550,(select id from Manufacturer where Name = 'Nike'),
								(select id from TypeGoods where Name = 'Одежда')),
		('Футболка',50,800,600,(select id from Manufacturer where Name = 'Adidas'),
								(select id from TypeGoods where Name = 'Одежда')),
		('Кроссовки',40,2000,1500,(select id from Manufacturer where Name = 'Adidas'),
								(select id from TypeGoods where Name = 'Обувь')),
		('Боксёрские перчатки',20,1700,1200,(select id from Manufacturer where Name = 'Puma'),
								(select id from TypeGoods where Name = 'Спортивное снаряжение')),
		('Гантели',10,1000,800,(select id from Manufacturer where Name = 'Under Armour'),
								(select id from TypeGoods where Name = 'Спортивное снаряжение')),
		('Наколенники',40,500,400,(select id from Manufacturer where Name = 'Reebok'),
								(select id from TypeGoods where Name = 'Защитное снаряжение')),
		('Шлем',50,900,700,(select id from Manufacturer where Name = 'Reebok'),
								(select id from TypeGoods where Name = 'Защитное снаряжение')),
		('Гантели',100,1000,600,(select id from Manufacturer where Name = 'Nike'),
							(select id from TypeGoods where Name = 'Спортивное снаряжение'))


INSERT INTO Seller(Name,Surname,LastName,Salary,Sex,StartWorkDate,JobPositionId)
VALUES  ('Александра','Кузнецова','Игоревна',10000,'женский','2020-06-12',
		(select id from JobPosition where Name = 'Продавец-консультант')),

		('Максим','Иванов','Сергеевич',10000,'мужской','2021-03-10',
		(select id from JobPosition where Name = 'Продавец-консультант')),

		('Екатерина','Петрова','Александровна',25000,'женский','2014-01-11',
		(select id from JobPosition where Name = 'Менеджер по продажам')),

		('Андрей','Смирнов','Владимирович',20000,'мужской','2013-08-08',
		(select id from JobPosition where Name = 'Администратор магазина'))

insert into Client(Name,Surname,LastName,Phone,Email,Sex)
values('Александр','Сергеев','Иванович','289083827','alex@gmail.com','мужской'),
		('Сергей','Петров','Семенович','398348503','gsdgs@gmail.com','мужской'),
		('Игорь','Воробьёв','Андреевич','23423452','alfdghjex@gmail.com','мужской'),
		('Николай','Романов','Сергеевич','5665464356','sdfgse@gmail.com','мужской'),
		('Андрей','Сидоров','Петрович','76534553','srgsdfg@gmail.com','мужской')


---- проверки


insert into Sales(GoodsId,ClientId,SellerId,Count)
values((select id from Goods where Name = 'Футболка' and
			ManufacturerId = (select id from Manufacturer where Name = 'Nike')),
		(select id from Client where Name = 'Александр' and Surname = 'Сергеев'),
		(select id from Seller where Name = 'Александра' and Surname = 'Кузнецова'),22)

insert into Sales(GoodsId,ClientId,SellerId,Count)
values((select id from Goods where Name = 'Футболка' and
			ManufacturerId = (select id from Manufacturer where Name = 'Adidas')),
		(select id from Client where Name = 'Андрей' and Surname = 'Сидоров'),
		(select id from Seller where Name = 'Максим' and Surname = 'Иванов'),10)

insert into Sales(GoodsId,ClientId,SellerId,Count)
values((select id from Goods where Name = 'Гантели' and
			ManufacturerId = (select id from Manufacturer where Name = 'Under Armour')),
		(select id from Client where Name = 'Андрей' and Surname = 'Сидоров'),
		(select id from Seller where Name = 'Максим' and Surname = 'Иванов'),10)

insert into Sales(GoodsId,ClientId,SellerId,Count)
values((select id from Goods where Name = 'Боксёрские перчатки' and
			ManufacturerId = (select id from Manufacturer where Name = 'Puma')),
		(select id from Client where Name = 'Игорь' and Surname = 'Воробьёв'),
		(select id from Seller where Name = 'Екатерина' and Surname = 'Петрова'),20)

insert into Sales(GoodsId,ClientId,SellerId,Count)
values((select id from Goods where Name = 'Кроссовки' and
			ManufacturerId = (select id from Manufacturer where Name = 'Adidas')),
		(select id from Client where Name = 'Игорь' and Surname = 'Воробьёв'),
		(select id from Seller where Name = 'Екатерина' and Surname = 'Петрова'),30)

insert into Client(Name,Surname,LastName,Phone,Email,Sex)
values('Александр','Александров','Иванович','23213131312','alex123@gmail.com','мужской')

insert into Client(Name,Surname,LastName,Phone,Email,Sex)
values('Александр','Сергеев','Иванович','289083827','alex@gmail.com','мужской')

delete from Client where Id = 2
delete from Seller where Id = 12

INSERT INTO Seller(Name,Surname,LastName,Salary,Sex,StartWorkDate,JobPositionId)
VALUES  ('Андрей','Смирнов','Владимирович',20000,'мужской','2013-08-08',
		(select id from JobPosition where Name = 'Администратор магазина'))

INSERT INTO Seller(Name,Surname,LastName,Salary,Sex,StartWorkDate,JobPositionId)
VALUES  ('Олег','Васильев','Владимирович',20000,'мужской','2013-08-08',
		(select id from JobPosition where Name = 'Администратор магазина'))

insert into Sales(GoodsId,ClientId,SellerId,Count)
values((select id from Goods where Name = 'Шотры' and
			ManufacturerId = (select id from Manufacturer where Name = 'Nike')),
		(select id from Client where Name = 'Андрей' and Surname = 'Сидоров'),
		(select id from Seller where Name = 'Максим' and Surname = 'Иванов'),49)

INSERT INTO Goods(Name,CountOfGoodsInStock,Price,CostPrice,ManufacturerId,TypeGoodsId)
VALUES  ('Футболка',100,700,500,(select id from Manufacturer where Name = 'Спорт, солнце и штанга'),
								(select id from TypeGoods where Name = 'Одежда'))

insert into Sales(GoodsId,ClientId,SellerId,Count)
values((select id from Goods where Name = 'Гантели' and
			ManufacturerId = (select id from Manufacturer where Name = 'Nike')),
		(select id from Client where Name = 'Андрей' and Surname = 'Сидоров'),
		(select id from Seller where Name = 'Максим' and Surname = 'Иванов'),99)

