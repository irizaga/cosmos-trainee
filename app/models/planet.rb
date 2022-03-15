# frozen_string_literal: true

class Planet < ApplicationRecord
  belongs_to :star
  has_many :moons, dependent: :destroy

  enum category: { rocky: 0, gaseous: 1 }

  validates :name, presence: true, uniqueness: { scope: :star_id }
  validates :mass, presence: true, numericality: { greater_than: 0 }
  validates :distance_from_star, presence: true, numericality: { greater_than: 0 }
  validates :orbital_period, presence: true, numericality: { greater_than: 0 }
  validates :tidally_locked, inclusion: [true, false], exclusion: [nil]
  validates :category, presence: true
  validates :star, associated: true
end
