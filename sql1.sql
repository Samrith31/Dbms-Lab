create database bank1;
use bank1;

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
    
    create table Loan(
      Loan_number int,
      Branch_Name varchar(20),
      Amount real,
      foreign key(Branch_Name) references Branch(Branch_Name));
      
	insert into Branch values('SBI_Chamrajpet','Bangalore',50000);
    insert into Branch values('SBI_ResidencyRoad','Bangalore',10000);
    insert into Branch values('SBI_ShivajiRoad','Bombay',20000);
    insert into Branch values('SBI_ParlimentRoad','Delhi',10000);
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
            insert into Depositers values('Mohan',3);
                insert into Depositers values('Nikil',4);
                    insert into Depositers values('Ravi',5);
                    insert into Depositers values('Avinash',2);
                     insert into Depositers values('Avinash',3);
                      insert into Depositers values('Dinesh',6);
                     
					
    select * from  Depositers;
    
  insert into Loan values(1,'SBI_Chamrajpet',1000);
  insert into Loan values(2,'SBI_ResidencyRoad',2000);
  insert into Loan values(3,'SBI_ShivajiRoad',3000);
  insert into Loan values(4,'SBI_ParlimentRoad',4000);
  insert into Loan values(5,'SBI_Jantarmantar',5000);
  
  select * from Loan;
  
  select Branch_Name, Assets/100000 as Assets_in_Lakhs from Branch;
  select d.customer_name from BankAccounts ba  join Depositers d 
  on ba.accno=d.accno 
  where ba.Branch_Name='SBI_Chamrajpet'
  group by d.customer_name having count(*)>1;
  
  create view sumloan1 as select sum(Amount),Branch_Name from Loan group by Branch_Name;
  select * from sumloan1;
    
 