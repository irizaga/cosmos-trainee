# frozen_string_literal: true

class Moon < ApplicationRecord
  belongs_to :planet

  validates :name, presence: true, uniqueness: { scope: :planet_id }
  validates :mass, presence: true, numericality: { greater_than: 0 }
  validates :distance_from_planet, presence: true, numericality: { greater_than: 0 }
  validates :orbital_period, presence: true, numericality: { greater_than: 0 }
  validates :tidally_locked, inclusion: [true, false], exclusion: [nil]
  validates :planet, associated: true
end
