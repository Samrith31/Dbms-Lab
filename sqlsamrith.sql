create database bank2;
use bank2;

create table Branch(
 Branch_Name varchar(20),
 Branch_city varchar(20),
 Assets real,
 primary key(Branch_Name));
 


create table BankAccounts(
    accno int,
    Branch_Name varchar(20),
   balance real,
   primary key(accno),
   foreign key(Branch_Name) references Branch(Branch_Name));
   
create table BankCustomer(
       customer_name varchar(20),
       customer_street varchar(20),
       customer_city varchar(20),
       primary key(customer_name));
       
   create table Depositers(
      customer_name varchar(20),
      accno int,
	foreign key(customer_name) references BankCustomer(customer_name),
    foreign key(accno)references BankAccounts(accno));
    
    create table loan1(
      loan_number int,
      Branch_Name varchar(20),
      Amount real,
      primary key(loan_number),
      foreign key(Branch_Name) references Branch(Branch_Name));
      
      
      create table borrower(
      customer_name varchar(20),
      loan_number int,
      primary key(customer_name,loan_number),
      foreign key(customer_name)references BankCustomer(customer_name),
      foreign key (loan_number) references loan1(loan_number));
      
      
	insert into Branch values('SBI_Chamrajpet','Bangalore',50000);
    insert into Branch values('SBI_ResidencyRoad','Bangalore',10000);
    insert into Branch values('SBI_ShivajiRoad','Bombay',20000);
    insert into Branch values('SBI_ParlimentRoad','Delhi',10000);
     insert into Branch values('SBI_vidhanasoudha','Delhi',80000);
    insert into Branch values('SBI_Jantarmantar','Delhi',20000);
    
    select * from Branch;
    
    insert into BankAccounts values(1,'SBI_Chamrajpet',2000);
    insert into BankAccounts values(2,'SBI_ResidencyRoad',5000);
	insert into BankAccounts values(3,'SBI_ShivajiRoad',6000);
	insert into BankAccounts values(4,'SBI_ParlimentRoad',9000);
    insert into BankAccounts values(5,'SBI_Jantarmantar',8000);
    insert into BankAccounts values(6,'SBI_Chamrajpet',9000);
    
    select * from BankAccounts;
        
	insert into BankCustomer values('Avinash','Bull_Temple_Road','Bangalore');
    insert into BankCustomer values('Dinesh','Bannergatta_Road','Bangalore');
    insert into BankCustomer values('Mohan','NationalCollege_Road','Bangalore');
    insert into BankCustomer values('Nikil','Akbar_Road','Delhi');
    insert into BankCustomer values('Ravi','Prithiviraj_Road','Delhi');
    
    select * from BankCustomer;
    
    insert into Depositers values('Avinash',1);
    insert into Depositers values('Dinesh',2);
            insert into Depositers values('Nikil',4);
                insert into Depositers values('Ravi',5);
                   
                    insert into Depositers values('Nikil',1);
                 
                     
					
    select * from  Depositers;
    
  insert into loan1 values(1,'SBI_Chamrajpet',1000);
  insert into loan1 values(2,'SBI_ResidencyRoad',2000);
  insert into loan1 values(3,'SBI_ShivajiRoad',3000);
  insert into loan1 values(4,'SBI_ParlimentRoad',4000);
  insert into loan1 values(5,'SBI_Jantarmantar',5000);
  
  select * from loan1;
  
  insert into  borrower values('Avinash',1);
  insert into  borrower values('Dinesh',2);
  insert into  borrower values('Mohan',3);
  insert into  borrower values('Nikil',4);
  insert into  borrower values('Ravi',5);
  
  select * from borrower;
  
  
 select customer_name,count(distinct(ba.Branch_Name)) from Depositers d,BankAccounts ba,Branch b 
 where d.accno=ba.accno and ba.Branch_Name=b.Branch_name and b.Branch_city='Bangalore'
 group by customer_name having count(distinct ba.Branch_Name)=( select count(Branch_Name) from Branch where Branch_city='Bangalore');
 
 
  
  
  
select customer_name from borrower where customer_name not in (select customer_name from Depositers);




-- 
select distinct customer_name from borrower  b1
where exists(select customer_name from Depositers  b2
where b1.customer_name=b2.customer_name);



update BankAccounts set balance= (balance+(balance *0.05));
select balance from BankAccounts;


delete from BankAccounts where Branch_Name in (select Branch_Name from Branch where Branch_city='Bombay');
select * from BankAccounts;

select Branch_Name from Branch where Assets > all(select Assets from Branch where Branch_city='Bangalore');

