require 'benchmark/ips'

Benchmark.ips do |x|
  x.config(:time => 5, :warmup => 2)
  times = 400
  x.report("upcase first") do |times|
    i = 0
    while i < times
      "x " * 10000 + "asdfdsffd sdfdsf  dfdff  sdfdfdf   d d d dd d ddlfskjsfldjk sdfjfjfjjfj".upcase.scan(/\b[A-Z]/).join
      i += 1
    end
  end
  x.report("upcase last") do |times|
    i = 0
    while i < times
      "x " * 10000 + "asdfdsffd sdfdsf  dfdff  sdfdfdf   d d d dd d ddlfskjsfldjk sdfjfjfjjfj".scan(/\b[a-zA-Z]/).join.upcase
      i += 1
    end
  end
  x.compare!
end


# Benchmark.ips do |x|
#   (1..1000).each do |i|
#     "asdfdsffd sdfdsf  dfdff".scan(/\b[a-zA-Z]/).upcase.join
#   end
# end