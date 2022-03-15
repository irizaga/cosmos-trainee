# frozen_string_literal: true

systems_min_count = 500
sun_mass = 332_889.71474
star_categories = Star.categories.keys
planet_categories = Planet.categories.keys

systems_count = rand(systems_min_count..systems_min_count + 50)
(0..systems_count).map do |star_index|
  name = "Star #{star_index + 1}"

  Rails.logger.debug { "create #{name}" }
  star = Star.create!(
    name: name,
    mass: sun_mass * rand(0.1..200.0),
    distance_from_earth: rand(4.0..200.0),
    category: star_categories.sample
  )

  planets_count = rand(0..16)
  (0..planets_count).each do |planet_index|
    distance = (planet_index + 1) * rand(0.2..1.5)
    name = "Planet S#{star_index + 1}-#{planet_index + 1}"

    Rails.logger.debug { "create #{name}" }
    planet = Planet.create!(
      name: name,
      mass: (planet_index + 1) * rand(0.1..50.0),
      distance_from_star: distance,
      orbital_period: (planet_index + 1) * rand(0.5..3.0),
      tidally_locked: distance < 0.8,
      category: planet_categories.sample,
      star: star
    )

    moons_count = (planet_index + 1) * rand(0..3)
    (0..moons_count).each do |moon_index|
      distance = (moon_index + 1) * rand(0.2..1.5)
      name = "Moon S#{star_index + 1}-P#{planet_index + 1}-#{moon_index + 1}"

      Rails.logger.debug { "create #{name}" }
      Moon.create!(
        name: name,
        mass: rand(0.1..0.7),
        distance_from_planet: distance,
        orbital_period: (planet_index + 1) * rand(0.5..3.0),
        tidally_locked: distance < 0.8,
        planet: planet
      )
    end
  end
end
