# frozen_string_literal: true

require_relative '../rails_helper'

RSpec.describe HabitableZones, type: :service do
  before do
    star_one = Star.create(name: 'Star One', mass: 1, category: 'A', distance_from_earth: 1)
    star_one.planets.create(name: 'Planet One', mass: 1, distance_from_star: 0.2, orbital_period: 30,
                            category: 'rocky', tidally_locked: false)
    star_one.planets.create(name: 'Planet Two', mass: 1, distance_from_star: 1, orbital_period: 30,
                            category: 'rocky', tidally_locked: false)
    star_one.planets.create(name: 'Planet Three', mass: 1, distance_from_star: 12, orbital_period: 30,
                            category: 'rocky', tidally_locked: false)
  end

  context 'when list is returned' do
    let(:habitable) { described_class.call(Planet.all) }

    it 'too_close is counted correctly' do
      expect(habitable[0]).to eq(1)
    end

    it 'habitable is counted correctly' do
      expect(habitable[1]).to eq(1)
    end

    it 'too_far is counted correctly' do
      expect(habitable[2]).to eq(1)
    end
  end
end
