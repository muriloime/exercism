import threading


CREATED = 'created'
OPEN = 'open'
CLOSED = 'closed'

class BankAccount(object):
    

    def __init__(self):
        self.balance = 0
        self.status = CREATED
        self.lock = threading.Lock()

    def get_balance(self):
        with self.lock:
            self.verify_account()
            return self.balance

    def open(self):
        if self.status == OPEN:
            raise ValueError('Account is already opened')
        self.status = OPEN
        self.balance = 0

    def deposit(self, amount):
        with self.lock:
            if amount < 0:
                raise ValueError('Amount must be positive')
            self.verify_account()
            self.balance += amount
            

    def withdraw(self, amount):
        with self.lock:
            if amount < 0:
                raise ValueError('Amount must be positive')
            self.verify_account()
            if self.balance >= amount:
                self.balance -= amount
            else:
                raise ValueError('Account hasnt enough balance')
    
    def close(self):
        self.verify_account()
        self.status = CLOSED

    def verify_account(self):
        if self.status != OPEN:
            raise ValueError('Account is closed')
