# frozen_string_literal: true

module Acronym
  def self.abbreviate(phrase)
    phrase.upcase.scan(/\b[A-Z]/).join
  end
end
