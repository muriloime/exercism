module PhoneNumber
  VALID_PHONE_REGEX = /^([2-9]\d{2}){2}\d{4}$/.freeze

  def self.clean(number)
    cleaned_number = number.gsub(/\D/, '').sub(/^1/, '')
    cleaned_number[VALID_PHONE_REGEX]
  end
end
