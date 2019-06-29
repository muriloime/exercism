class ComplexNumber
  attr_reader :real, :imaginary
  DELTA = 1e-10

  def initialize(real, imaginary)
    @real = real
    @imaginary = imaginary
  end

  def *(other)
    self.class.new(real * other.real - imaginary * other.imaginary,
                   real * other.imaginary + other.real * imaginary)
  end

  def abs
    (real**2 + imaginary**2)**0.5
  end

  def inv
    denom = abs**2
    self.class.new(real / denom, -imaginary / denom)
  end

  def /(other)
    self * other.inv
  end

  def +(other)
    self.class.new(real + other.real,
                   imaginary + other.imaginary)
  end

  def -(other)
    self.class.new(real - other.real,
                   imaginary - other.imaginary)
  end

  def ==(other)
    (real - other.real).abs < DELTA &&
      (imaginary - other.imaginary).abs < DELTA
  end

  def conjugate
    self.class.new(real, -imaginary)
  end

  def exp
    modulus = Math.exp(real)
    self.class.new(modulus * Math.cos(imaginary), modulus * Math.sin(imaginary))
  end
end
