# frozen_string_literal: true

class HabitableZones < ApplicationService
  def initialize(planets)
    @planets = planets
  end

  def call
    habitable_zones
  end

  private

  def habitable_zones
    too_close = []
    habitable_zone = []
    too_far = []
    @planets.each do |planet|
      if planet.distance_from_star < 0.3
        too_close << planet
      elsif planet.distance_from_star >= 0.3 && planet.distance_from_star < 10
        habitable_zone << planet
      else
        too_far << planet
      end
    end
    [too_close.length, habitable_zone.length, too_far.length]
  end
end
