# frozen_string_literal: true

require_relative '../rails_helper'

RSpec.describe ClosestSummary, type: :service do
  before do
    Star.create(name: 'Star One', mass: 1, category: 'A', distance_from_earth: 1)
    Star.create(name: 'Star Two', mass: 1, category: 'A', distance_from_earth: 0.5)
  end

  context 'when summary is returned' do
    it 'is filled correctly' do
      closest_summary = described_class.call(Star)
      expect(closest_summary.first.name).to eq('Star Two')
    end
  end
end
