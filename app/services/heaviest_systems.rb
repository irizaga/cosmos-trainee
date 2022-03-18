# frozen_string_literal: true

class HeaviestSystems < ApplicationService
  def initialize(stars)
    @stars = stars
  end

  def call
    heaviest_systems
  end

  private

  def heaviest_systems
    masses = [0]
    heaviest = [nil]
    total_system = []

    @stars.each do |star|
      system_mass = total_weight(star)

      if system_mass > masses.max
        masses.unshift(system_mass)
        heaviest.unshift(star.name)
      elsif system_mass > masses.min && system_mass < masses.max
        masses << system_mass
        heaviest << star.name
      end
      if masses.length > 5
        masses.pop
        heaviest.pop
      end
    end

    masses.each_with_index do |mass, index|
      total_system[index] = [heaviest[index], mass]
    end

    total_system
  end

  def total_weight(star)
    total_mass = 0
    total_mass += star.mass
    star.planets.each do |planet|
      total_mass += planet.mass
    end
    star.moons.each do |moon|
      total_mass += moon.mass
    end
    total_mass
  end
end
