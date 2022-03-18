# frozen_string_literal: true

require_relative '../rails_helper'

RSpec.describe MostRecent, type: :service do
  before do
    Star.create(name: 'Star One', mass: 1, category: 'A', distance_from_earth: 1)
    Star.create(name: 'Star Two', mass: 1, category: 'A', distance_from_earth: 1)
  end

  context 'when list is returned' do
    let(:recent) { described_class.call(Star.all) }

    it 'most recent star is returned correctly' do
      expect(recent.first.name).to eq('Star Two')
    end
  end
end
