# frozen_string_literal: true

module ETL
  def self.transform(old_format)
    Hash[
      old_format.flat_map do |value, letters| 
        letters.map { |letter| [letter.downcase, value] }
      end
    ]
  end
end
