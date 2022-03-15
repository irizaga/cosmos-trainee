# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Planet, type: :model do
  subject { described_class.create(valid_attributes) }

  let(:star) do
    Star.create(
      name: 'Sun',
      mass: 1.0,
      distance_from_earth: 1.0
    )
  end

  let(:valid_attributes) do
    {
      name: 'Earth',
      mass: 1.0,
      distance_from_star: 1.0,
      orbital_period: 365,
      tidally_locked: false,
      category: :rocky,
      star_id: star.id
    }
  end

  it { is_expected.to belong_to(:star) }
  it { is_expected.to have_many(:moons).dependent(:destroy) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).scoped_to(:star_id) }

  it { is_expected.to validate_presence_of(:mass) }
  it { is_expected.to validate_numericality_of(:mass).is_greater_than(0) }

  it { is_expected.to validate_presence_of(:distance_from_star) }
  it { is_expected.to validate_numericality_of(:distance_from_star).is_greater_than(0) }

  it { is_expected.to validate_presence_of(:orbital_period) }
  it { is_expected.to validate_numericality_of(:orbital_period).is_greater_than(0) }

  it { is_expected.to define_enum_for(:category) }
  it { is_expected.to validate_presence_of(:category) }
end
