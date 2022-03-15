# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Moon, type: :model do
  subject { described_class.create(valid_attributes) }

  let(:star) do
    Star.create(
      name: 'Sun',
      mass: 1.0,
      distance_from_earth: 1.0
    )
  end

  let(:planet) do
    Planet.create(
      name: 'Earth',
      mass: 1.0,
      distance_from_star: 1.0,
      orbital_period: 365,
      tidally_locked: false,
      category: :rocky,
      star_id: star.id
    )
  end

  let(:valid_attributes) do
    {
      name: 'Moon',
      mass: 0.03,
      distance_from_planet: 0.06,
      orbital_period: 28,
      tidally_locked: true,
      planet_id: planet.id
    }
  end

  it { is_expected.to belong_to(:planet) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).scoped_to(:planet_id) }

  it { is_expected.to validate_presence_of(:mass) }
  it { is_expected.to validate_numericality_of(:mass).is_greater_than(0) }

  it { is_expected.to validate_presence_of(:distance_from_planet) }
  it { is_expected.to validate_numericality_of(:distance_from_planet).is_greater_than(0) }

  it { is_expected.to validate_presence_of(:orbital_period) }
  it { is_expected.to validate_numericality_of(:orbital_period).is_greater_than(0) }
end
