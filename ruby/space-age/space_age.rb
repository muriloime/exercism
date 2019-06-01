# frozen_string_literal: true

class SpaceAge
  PERIOD_ON_EARTH_YEARS = { on_earth: 1.0,
                            on_mercury: 0.2408467,
                            on_venus: 0.61519726,
                            on_mars: 1.8808158,
                            on_jupiter: 11.862615,
                            on_saturn: 29.447498,
                            on_uranus: 84.016846,
                            on_neptune: 164.79132 }.freeze

  SECONDS_IN_EARTH_YEAR = 31_557_600.0

  def initialize(age_in_seconds)
    @age_in_seconds = age_in_seconds
  end

  def method_missing(m, *_args)
    if PERIOD_ON_EARTH_YEARS[m.to_sym]
      @age_in_seconds / SECONDS_IN_EARTH_YEAR / PERIOD_ON_EARTH_YEARS[m.to_sym]
    else
      super
    end
  end
end
