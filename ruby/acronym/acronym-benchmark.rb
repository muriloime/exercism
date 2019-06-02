# frozen_string_literal: true

require 'benchmark/ips'
Benchmark.ips do |x|
  x.config(time: 5, warmup: 2)

  sample_string = 'asdfdsffd sdfdsf  dfdff  sdfdfdf   d d d dd d ddlfskjsfldjk sdfjfjfjjfj'
  x.report('upcase first') do |_|
    sample_string.upcase.scan(/\b[A-Z]/).join
  end

  x.report('upcase last') do |_|
    sample_string.scan(/\b[a-zA-Z]/).join.upcase
  end

  x.report('upcase last with alpha') do |_|
    sample_string.scan(/\b[[:alpha:]]/).join.upcase
  end

  x.report('upcase last simple ') do |_|
    sample_string.scan(/\b\w/).join.upcase
  end
  x.compare!
end
