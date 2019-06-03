import re 

def clean(phone_number):
    numbers = re.sub("[^0-9]", "", phone_number)
    if len(numbers) == 11 and numbers[0] == '1':
        return numbers[1:]
    elif len(numbers) == 10:
        return numbers
    else:
        raise ValueError("Invalid Phone")
        
class Phone(object):
    def __init__(self, phone_number):
        self.number = clean(phone_number)
        PHONE_SPLIT = [(0,3),(3,6),(6,10)]
        self.area_code, self.exchange, self.subscriber = [self.number[k:v] for k,v in PHONE_SPLIT ]
        if self.exchange[0] in ['1', '0']: raise ValueError("Exchange cannot start with 1")
        if self.area_code[0] in ['1', '0']: raise ValueError("Local cannot start with 1")

    def pretty(self):
        return f"({self.area_code}) {self.exchange}-{self.subscriber}"

