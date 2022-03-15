# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Star, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }

  it { is_expected.to validate_presence_of(:mass) }
  it { is_expected.to validate_numericality_of(:mass).is_greater_than(0) }

  it { is_expected.to validate_presence_of(:distance_from_earth) }
  it { is_expected.to validate_numericality_of(:distance_from_earth).is_greater_than(0) }

  it { is_expected.to define_enum_for(:category) }
  it { is_expected.to validate_presence_of(:category) }
end
