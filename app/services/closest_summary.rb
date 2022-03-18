# frozen_string_literal: true

class ClosestSummary < ApplicationService
  def initialize(stars)
    @stars = stars
  end

  def call
    closest_summary
  end

  private

  def closest_summary
    closest = []
    @stars.order(:distance_from_earth).limit(10).each do |star|
      closest << star
    end
    closest
  end
end
