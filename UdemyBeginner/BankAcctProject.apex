public class BankAccount {
    private Decimal accountBalance = 0;
    private static Decimal combinedBalance = 0;
    
    public void deposit(Decimal depAmt){
        accountBalance += depAmt;
		combinedBalance += depAmt;        
    }
    
    public void withdrawal(Decimal wthd){
        accountBalance -= wthd;
        combinedBalance -= wthd;
    }
    
    public Decimal getBalance(){
        return accountBalance;
    }
    
    public static Decimal getCombBal(){
        return combinedBalance;
    }
    
}

BankAccount checkingAccount = new BankAccount();
checkingAccount.deposit(200.00);
checkingAccount.withdrawal(150.00);

BankAccount savingsAccount = new BankAccount();
savingsAccount.deposit(300.00);
savingsAccount.withdrawal(75.00);

System.debug('Checking Account Balance: $' + checkingAccount.getBalance());
System.debug('Savings Account Balance: $' + savingsAccount.getBalance());
System.debug('Combined Balance: $' + BankAccount.getCombBal());