List<Account> acctList = new List<Account>();
Integer emp = 2500;

for(Integer i = 0; i < 11; i++){
    Account acct = new Account(Name = 'Assignment Account' + i, NumberOfEmployees = emp);
        acctList.add(acct);
    	emp += 750;
}

upsert acctList;


SELECT Id, Name, NumberOfEmployees
FROM Account
WHERE Name LIKE 'Assignment%'
ORDER BY NumberOfEmployees ASC NULLS LAST
LIMIT 5

// Provided Solution
List<Account> acctList = new List<Account>();

for(Integer i = 0; i < 11; i++){
    Account acct = new Account();
    acct.name = Name = 'Assignment Account ' + i;
        acctList.add(acct);    	
}

insert acctList;

Integer emp = 2500;

for(Account acct : acctList){
    acct.NumberOfEmployees = emp;
    emp += 750;
}

update acctList;