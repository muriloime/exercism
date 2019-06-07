module PhoneNumber
  VALID_PHONE_REGEX = /\b[2-9]\d{2}[2-9]\d{2}\d{4}\b/.freeze

  def self.clean(number)
    cleaned_number = number.gsub(/\D/, '')
    cleaned_number[0] = '' if cleaned_number[0] == '1'
    cleaned_number.scan(VALID_PHONE_REGEX).first
  end
end
