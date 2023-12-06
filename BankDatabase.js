var mysql = require('mysql2');

var pool = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "Dakar2002kc!",
  connectionLimit:10
});

//Query to update amount in the account by searching using the account number, first, all account information is displayed
var userAccNum = 1;
var updatedAmount = 324;
console.log("Update amount in account Query:");

pool.query('SELECT bank.account.* FROM bank.account WHERE bank.account.acc_num = (?)',[userAccNum], function (err, result, fields){
    if (err) throw err;
    console.log(result);
  });
pool.query('UPDATE bank.account SET account.amount = (?) WHERE bank.account.acc_num = (?)',[updatedAmount,userAccNum],function (err, result, fields){
    if (err) throw err;
    console.log(result);
});
//Query for taking out a loan. After new loan is created, all current loans for the customer is displayed 
var cust_idLoan=2;
console.log("Query for taking out loans:");
pool.query('INSERT INTO `bank`.`loan`(`amount`,`type`,`loan_id`,`branch_num`,`account_num`) VALUES (100,"subsadized",2,2,(?))',[cust_idLoan],function(err,result,fields){
    if (err) throw err;
    console.log("Loan added to account");
});
pool.query('SELECT bank.loan.* FROM bank.loan WHERE bank.loan.account_num = (?)',[cust_idLoan],function(err,result){
    if (err) throw err;
    console.log(result);
});
//Query for customer creating a new account
var cust_idNew_account=3;
console.log("Query for creating new account for customer:");
pool.query('INSERT into bank.account (amount,acc_num,cust_id) VALUES (50000,5,(?))',[cust_idNew_account],function(err,result){
    if (err) throw err;
    console.log("New account created");
});
pool.query('SELECT bank.account.* FROM bank.account WHERE bank.account.cust_id = (?)',[cust_idNew_account],function(err,result){
    if (err) throw err;
    console.log(result);
});
//Query for a new transaction occurence, after new transaction, list of all transactions for the customer is displayed
var transactionAmount=50;
var AccNumTransaction=3;
pool.query('INSERT INTO bank.transaction (id,account_num,amount,date) VALUES (2,(?),(?),"1980-12-30")',[AccNumTransaction,transactionAmount],function(err,result){
    if (err) throw err;
    console.log("New transaction of $ %d",transactionAmount);
});
pool.query('SELECT bank.transaction.* FROM bank.transaction WHERE bank.transaction.account_num = (?)',[AccNumTransaction],function(err,result){
    if (err) throw err;
    console.log(result);
})

