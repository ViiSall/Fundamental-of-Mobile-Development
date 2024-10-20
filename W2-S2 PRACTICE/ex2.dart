class BankAccount {
  final int accountId;
  final String accountOwner;
  double _balance;

  BankAccount({required this.accountId, required this.accountOwner}) : _balance = 0.0;

  double get balance => _balance;

  void credit(double amount) {
    _balance += amount;
  }

  void withdraw(double amount) {
    if (_balance - amount < 0) {
      throw Exception('Insufficient balance for withdrawal!!!');
    }
    _balance -= amount;
  }

  @override
  String toString() {
    return 'Account ID: $accountId, Owner: $accountOwner, Balance: \$$_balance';
  }
}

class Bank {
  final String name;
  final List<BankAccount> _accounts = [];

  Bank({required this.name});

  // Method for creating a new bank account
  BankAccount createAccount(int accountId, String accountOwner) {
    for (var account in _accounts) {
      if (account.accountId == accountId) {
        throw Exception('Account with ID $accountId already exists!');
      }
    }
    var newAccount = BankAccount(accountId: accountId, accountOwner: accountOwner);
    _accounts.add(newAccount);
    return newAccount;
  }

  // Method for finding account
  BankAccount? findAccount(int accountId) {
    for (var account in _accounts) {
      if (account.accountId == accountId) {
        return account;
      }
    }
    return null;
  }

  @override
  String toString() {
    return 'Bank Name: $name, Total Accounts: ${_accounts.length}';
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount visalAccount = myBank.createAccount(001, 'Visal');

  print('Your account has ${visalAccount.balance}\$');
  visalAccount.credit(100);
  print('You have added some money to your credit\, so your account has ${visalAccount.balance}\$');

  // Find an account by ID
  BankAccount? foundAccount = myBank.findAccount(001);
  if (foundAccount != null) {
    print('Found Account: ${foundAccount.accountOwner}, Balance: ${foundAccount.balance}\$');
  } else {
    print('Account not found');
  }

  // Try finding an account that doesn't exist
  BankAccount? nonExistentAccount = myBank.findAccount(002);
  if (nonExistentAccount == null) {
    print('Account with ID 002 not found.');
  }
}
