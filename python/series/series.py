def slices(series, length):
  series_number = len(series) - length + 1
  if series_number <= 0 or length <= 0: 
    raise ValueError('error')
  return [series[start:start+length]  for start in range(series_number) ]
