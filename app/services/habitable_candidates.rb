# frozen_string_literal: true

class HabitableCandidates < ApplicationService
  def initialize(stars)
    @stars = stars
  end

  def call
    habitable_candidates
  end

  private

  def habitable_candidates
    candidates = []
    @stars.order(:distance_from_earth).each do |star|
      star.planets.each do |planet|
        candidates << planet if category(planet) && tidally_locked(planet) && distance(planet) && mass(planet)
      end
    end
    candidates
  end

  def tidally_locked(param)
    return false unless param.tidally_locked == false

    true
  end

  def category(param)
    return false unless param.category == 'rocky'

    true
  end

  def distance(param)
    return false unless param.distance_from_star > 0.3 && param.distance_from_star < 10

    true
  end

  def mass(param)
    return false unless param.mass > 0.6 && param.mass < 2

    true
  end
end
