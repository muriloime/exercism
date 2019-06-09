require 'benchmark/ips'
require_relative 'isogram'

Benchmark.ips do |x|
  x.config(time: 5, warmup: 2)

  sample_string = 'sadfsdfdf'
  x.report('old approach') do |_|
    Isogram.isogram2?(sample_string)
  end

  x.report('new approach') do |_|
    Isogram.isogram?(sample_string)
  end
  x.compare!
end
