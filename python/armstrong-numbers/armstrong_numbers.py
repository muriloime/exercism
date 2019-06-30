def is_armstrong_number(number):
  length = len(str(number))
  return number == sum(int(x) ** length for x in str(number ))
