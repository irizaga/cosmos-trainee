# frozen_string_literal: true

class MostRecent < ApplicationService
  def initialize(stars)
    @stars = stars
  end

  def call
    most_recent
  end

  private

  def most_recent
    recent = []

    @stars.order(created_at: :DESC).limit(5).each do |star|
      recent << star
    end

    recent
  end
end
