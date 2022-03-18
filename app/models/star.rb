# frozen_string_literal: true

class Star < ApplicationRecord
  has_many :planets, dependent: :destroy
  has_many :moons, through: :planets

  enum :category, %i[O B A F G K M]

  validates :name, presence: true, uniqueness: true
  validates :mass, presence: true, numericality: { greater_than: 0 }
  validates :distance_from_earth, presence: true, numericality: { greater_than: 0 }
  validates :category, presence: true
end
