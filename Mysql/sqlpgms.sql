CREATE TABLE client_master (
    clientno VARCHAR(6) PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    city VARCHAR(15) NOT NULL,
    pincode INT NOT NULL,
    state VARCHAR(15) NOT NULL,
    baldue DECIMAL(10,2) NOT NULL,
    CONSTRAINT chk_clientno CHECK (clientno LIKE 'c%')
);

DESC client_master;

CREATE TABLE product_master (
    productno VARCHAR(6) PRIMARY KEY,
    description VARCHAR(15) NOT NULL,
    profitpercent DECIMAL(4,2) NOT NULL,
    unitmeasure VARCHAR(10) NOT NULL,
    qtyonhand INT NOT NULL,
    reorderlvl INT NOT NULL,
    sellprice DECIMAL(8,2) NOT NULL CHECK (sellprice > 0),
    costprice DECIMAL(8,2) NOT NULL CHECK (costprice > 0),
    CONSTRAINT chk_productno CHECK (productno LIKE 'p%')
);

DESC product_master;

CREATE TABLE salesman_master (
    salesmanno VARCHAR(6) PRIMARY KEY,
    salesmanname VARCHAR(20) NOT NULL,
    address VARCHAR(30) NOT NULL,
    address2 VARCHAR(20) NOT NULL,
    city VARCHAR(10),
    pincode INT,
    state VARCHAR(15),
    salamt DECIMAL(6,2) NOT NULL CHECK (salamt > 0),
    tgttoget DECIMAL(6,2) NOT NULL CHECK (tgttoget > 0),
    ytdsales DECIMAL(6,2) NOT NULL,
    remarks VARCHAR(60),
    CONSTRAINT chk_salesmanno CHECK (salesmanno LIKE 's%')
);

DESC salesman_master;

CREATE TABLE sales_order (
    orderno VARCHAR(6) PRIMARY KEY,
    clientno VARCHAR(6),
    orderdate DATE NOT NULL,
    salesmanno VARCHAR(6),
    deltype CHAR(1) DEFAULT 'f' CHECK (deltype IN ('f', 'p')),
    billyn CHAR(1),
    delydate DATE,
    orderstatus VARCHAR(10) CHECK (orderstatus IN ('backorder', 'fullfilled', 'cancelled', 'inprocess')),
    CONSTRAINT fk_client FOREIGN KEY (clientno) REFERENCES client_master(clientno) ON DELETE CASCADE,
    CONSTRAINT fk_salesman FOREIGN KEY (salesmanno) REFERENCES salesman_master(salesmanno) ON DELETE SET NULL,
    CONSTRAINT chk_orderno CHECK (orderno LIKE 'o%'),
    CONSTRAINT chk_delydate CHECK (delydate >= orderdate)
);

DESC sales_order;

create table sales_order_details(orderno varchar(6) PRIMARY KEY,
productno varchar(6),
qtyordered INT(8),
qtydisp int(8),
productrate DECIMAL(10,2),
CONSTRAINT fk_orderno FOREIGN KEY (orderno) REFERENCES sales_order(orderno) ON DELETE CASCADE,
CONSTRAINT fk_productno FOREIGN KEY(productno) REFERENCES product_master(productno) ON DELETE CASCADE);

DESC sales_order_details;



alter table product_master modify sellprice DECIMAL(10,2);
DESC product_master;


INSERT INTO client_master VALUES
('c00001', 'ivanbayross', 'mumbai', 400054, 'maharashtra', 1500.00),
('c00002', 'mamtamuzmdar', 'chennai', 780000, 'tamil nadu', 0.00);

            
select * from client_master;

insert into product_master values('p0001','t-shirt',5,'piece',200,50,350,250),
                                  ('p0345','shirts',6,'piece',150,50,500,350);
                                  
select * from product_master;

insert into salesman_master values('s00001','aman','a/17','worli','mumbai',400002,'maharashtra',3000,100,50,'good'),
                                    ('s00002','omkar','65','nariman','mumbai',400001,'maharashtra',3000,200,100,'good');
                                    
select * from salesman_master;

insert into sales_order values('o19001','c00001','2002-07-20','s00001','f','n','2004-07-12','inprocess'),
                              ('o19002','c00002','2002-07-27','s00002','p','n','2004-06-25','cancelled');
select * from sales_order;

insert into sales_order_details values('o19001','p0345',4,4,525),
                                      ('o19002','p0001',4,1,8400);
                                      
select * from sales_order_details;

update client_master set city="banglore" where clientno='c00001';

select * from client_master where clientno='c00001';

update client_master set baldue=1000 where clientno='c00001';
select * from client_master where clientno='c00001';

update product_master set costprice=950 where description='t-shirt';
select * from product_master;

select * from product_master order by costprice;

create table prd as select productno,description from product_master;
show tables;
select * from prd;

select count(state) from salesman_master;
select * from sales_order,sales_order_details;

select A2.salesmanno,A2.orderno from sales_order_details as A1 inner join sales_order as A2 on A1.orderno=A2.orderno; 

desc sales_order;
select * from sales_order;

desc salesman_master;
select * from salesman_master;


select salesmanname from salesman_master where salesmanno=(select salesmanno from sales_order where orderstatus='cancelled');


