class SecretHandshake
  HANDSHAKE_STEP_CODES = { 0b00001 => 'wink',
                           0b00010 => 'double blink',
                           0b00100 => 'close your eyes',
                           0b01000 => 'jump' }.freeze
  REVERSE_CODE = 0b10000

  def initialize(code)
    @code = code.to_i
  end

  def commands
    HANDSHAKE_STEP_CODES.select { |step, _| (@code & step).positive? }
                        .values
                        .then do |steps|
      (@code & REVERSE_CODE).positive? ? steps.reverse : steps
    end
  end
end
