# BUDGET TRACKER 

## Budget Tracking App Scenario: 
With most of us earning 'proper' money for the first times in our lives it will be useful to keep track of our spending habits. This is a monthly budget tracker. Therefore, it is a based on a fixed period. 
The user enters the frequency; if 1 is selected then the budget is only for that month, if 2 is selected then the budget is for 2 months. The proposed journey of a user is: 
> - A user creates account, so we insert data into the User table.
> - The User creates a custom Budget, by providing the name, and the limit for that budget, so an insert into the budget table.
> - Then the User will enter the date they want the budget to start and how frequent they want the budget to repeat, this would be an insert in the Period table.
> - Then a user will enter what triggers they want to be used to identify transactions falling under that Budget, so an insert into the BudgetSetting table.
> - Then they will "upload" a bank statement with transactions, so an insert into the Transaction table.
> - then from there all Transactions that have that trigger word, they will be categorized as being under that Budget. 

## ERD
![Image]("./Images/FinalERD.png")



**Group members* : Michael Coker, Mmasehume Raphiri, Raaga Krishna Velthapu,  Shagan Plaatjies
