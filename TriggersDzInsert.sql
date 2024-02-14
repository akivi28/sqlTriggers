use SportShop

INSERT INTO TypeGoods(Name)
VALUES ('������'),
       ('�����'),
       ('���������� ����������'),
       ('�������� ����������')

INSERT INTO Manufacturer(Name)
VALUES ('Nike'),
       ('Adidas'),
       ('Puma'),
       ('Under Armour'),
       ('Reebok'),
	   ('�����, ������ � ������')

INSERT INTO JobPosition(Name)
VALUES ('�������� �� ��������'),
       ('��������-�����������'),
       ('������������� ��������')

INSERT INTO Goods(Name,CountOfGoodsInStock,Price,CostPrice,ManufacturerId,TypeGoodsId)
VALUES  ('��������',100,700,500,(select id from Manufacturer where Name = 'Nike'),
								(select id from TypeGoods where Name = '������')),
		('�����',150,750,550,(select id from Manufacturer where Name = 'Nike'),
								(select id from TypeGoods where Name = '������')),
		('��������',50,800,600,(select id from Manufacturer where Name = 'Adidas'),
								(select id from TypeGoods where Name = '������')),
		('���������',40,2000,1500,(select id from Manufacturer where Name = 'Adidas'),
								(select id from TypeGoods where Name = '�����')),
		('��������� ��������',20,1700,1200,(select id from Manufacturer where Name = 'Puma'),
								(select id from TypeGoods where Name = '���������� ����������')),
		('�������',10,1000,800,(select id from Manufacturer where Name = 'Under Armour'),
								(select id from TypeGoods where Name = '���������� ����������')),
		('�����������',40,500,400,(select id from Manufacturer where Name = 'Reebok'),
								(select id from TypeGoods where Name = '�������� ����������')),
		('����',50,900,700,(select id from Manufacturer where Name = 'Reebok'),
								(select id from TypeGoods where Name = '�������� ����������')),
		('�������',100,1000,600,(select id from Manufacturer where Name = 'Nike'),
							(select id from TypeGoods where Name = '���������� ����������'))


INSERT INTO Seller(Name,Surname,LastName,Salary,Sex,StartWorkDate,JobPositionId)
VALUES  ('����������','���������','��������',10000,'�������','2020-06-12',
		(select id from JobPosition where Name = '��������-�����������')),

		('������','������','���������',10000,'�������','2021-03-10',
		(select id from JobPosition where Name = '��������-�����������')),

		('���������','�������','�������������',25000,'�������','2014-01-11',
		(select id from JobPosition where Name = '�������� �� ��������')),

		('������','�������','������������',20000,'�������','2013-08-08',
		(select id from JobPosition where Name = '������������� ��������'))

insert into Client(Name,Surname,LastName,Phone,Email,Sex)
values('���������','�������','��������','289083827','alex@gmail.com','�������'),
		('������','������','���������','398348503','gsdgs@gmail.com','�������'),
		('�����','��������','���������','23423452','alfdghjex@gmail.com','�������'),
		('�������','�������','���������','5665464356','sdfgse@gmail.com','�������'),
		('������','�������','��������','76534553','srgsdfg@gmail.com','�������')


---- ��������


insert into Sales(GoodsId,ClientId,SellerId,Count)
values((select id from Goods where Name = '��������' and
			ManufacturerId = (select id from Manufacturer where Name = 'Nike')),
		(select id from Client where Name = '���������' and Surname = '�������'),
		(select id from Seller where Name = '����������' and Surname = '���������'),22)

insert into Sales(GoodsId,ClientId,SellerId,Count)
values((select id from Goods where Name = '��������' and
			ManufacturerId = (select id from Manufacturer where Name = 'Adidas')),
		(select id from Client where Name = '������' and Surname = '�������'),
		(select id from Seller where Name = '������' and Surname = '������'),10)

insert into Sales(GoodsId,ClientId,SellerId,Count)
values((select id from Goods where Name = '�������' and
			ManufacturerId = (select id from Manufacturer where Name = 'Under Armour')),
		(select id from Client where Name = '������' and Surname = '�������'),
		(select id from Seller where Name = '������' and Surname = '������'),10)

insert into Sales(GoodsId,ClientId,SellerId,Count)
values((select id from Goods where Name = '��������� ��������' and
			ManufacturerId = (select id from Manufacturer where Name = 'Puma')),
		(select id from Client where Name = '�����' and Surname = '��������'),
		(select id from Seller where Name = '���������' and Surname = '�������'),20)

insert into Sales(GoodsId,ClientId,SellerId,Count)
values((select id from Goods where Name = '���������' and
			ManufacturerId = (select id from Manufacturer where Name = 'Adidas')),
		(select id from Client where Name = '�����' and Surname = '��������'),
		(select id from Seller where Name = '���������' and Surname = '�������'),30)

insert into Client(Name,Surname,LastName,Phone,Email,Sex)
values('���������','�����������','��������','23213131312','alex123@gmail.com','�������')

insert into Client(Name,Surname,LastName,Phone,Email,Sex)
values('���������','�������','��������','289083827','alex@gmail.com','�������')

delete from Client where Id = 2
delete from Seller where Id = 12

INSERT INTO Seller(Name,Surname,LastName,Salary,Sex,StartWorkDate,JobPositionId)
VALUES  ('������','�������','������������',20000,'�������','2013-08-08',
		(select id from JobPosition where Name = '������������� ��������'))

INSERT INTO Seller(Name,Surname,LastName,Salary,Sex,StartWorkDate,JobPositionId)
VALUES  ('����','��������','������������',20000,'�������','2013-08-08',
		(select id from JobPosition where Name = '������������� ��������'))

insert into Sales(GoodsId,ClientId,SellerId,Count)
values((select id from Goods where Name = '�����' and
			ManufacturerId = (select id from Manufacturer where Name = 'Nike')),
		(select id from Client where Name = '������' and Surname = '�������'),
		(select id from Seller where Name = '������' and Surname = '������'),49)

INSERT INTO Goods(Name,CountOfGoodsInStock,Price,CostPrice,ManufacturerId,TypeGoodsId)
VALUES  ('��������',100,700,500,(select id from Manufacturer where Name = '�����, ������ � ������'),
								(select id from TypeGoods where Name = '������'))

insert into Sales(GoodsId,ClientId,SellerId,Count)
values((select id from Goods where Name = '�������' and
			ManufacturerId = (select id from Manufacturer where Name = 'Nike')),
		(select id from Client where Name = '������' and Surname = '�������'),
		(select id from Seller where Name = '������' and Surname = '������'),99)

