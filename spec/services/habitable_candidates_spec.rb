# frozen_string_literal: true

require_relative '../rails_helper'

RSpec.describe HabitableCandidates, type: :service do
  before do
    star_one = Star.create(name: 'Star One', mass: 1, category: 'A', distance_from_earth: 1)
    star_one.planets.create(name: 'Planet One', mass: 0.8, distance_from_star: 0.5,
                        orbital_period: 30, category: 'rocky', tidally_locked: false)
    # Star Two is closer to Earth than Planet One, both planets are habitable
    star_two = Star.create(name: 'Star Two', mass: 1, category: 'O', distance_from_earth: 0.8)
    star_two.planets.create(name: 'Planet Two', mass: 0.7, distance_from_star: 1,
                            orbital_period: 30, category: 'rocky', tidally_locked: false)
  end

  context 'when list is returned' do
    it 'first on the list should be closest' do
      candidates = described_class.call(Star)
      expect(candidates.first.name).to eq('Planet Two')
    end
  end
end
