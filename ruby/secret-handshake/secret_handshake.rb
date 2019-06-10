class SecretHandshake
  HANDSHAKE_STEP_CODES = { 1 => 'wink',
                           2 => 'double blink',
                           4 => 'close your eyes',
                           8 => 'jump' }.freeze
  REVERSE_CODE = 16

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
