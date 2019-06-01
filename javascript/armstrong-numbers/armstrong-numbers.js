export const validate = (number) => {
  const numberOfDigits = number.toString().length;
  const sumOfPoweredDigits = number.toString().split('').reduce((a,b) => a + Number(b)**numberOfDigits, 0)
  return number == sumOfPoweredDigits
}