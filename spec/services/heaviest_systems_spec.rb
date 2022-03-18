# frozen_string_literal: true

require_relative '../rails_helper'

RSpec.describe HeaviestSystems, type: :service do
  before do
    star = Star.create(name: 'Star One', mass: 1, category: 'A', distance_from_earth: 1)
    planet = star.planets.create(name: 'Planet One', mass: 1, distance_from_star: 0.2,
                                 orbital_period: 30, category: 'rocky', tidally_locked: false)
    planet.moons.create(name: 'Moon One', mass: 1, distance_from_planet: 1, orbital_period: 30,
                        tidally_locked: false)
  end

  context 'when list is returned' do
    let(:heaviest) { described_class.call(Star.all) }

    it 'star name is returned correctly' do
      expect(heaviest.first[0]).to eq('Star One')
    end

    it 'total mass is returned correctly' do
      expect(heaviest.first[1].to_i).to eq(3)
    end
  end
end
