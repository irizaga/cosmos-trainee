# frozen_string_literal: true

class DashboardsController < ApplicationController
  def show
    @stars = Star.includes(:planets).all
    @planets = Planet.all
    @moons = Moon.all

    @habitable_candidates = HabitableCandidates.call(@stars)
  end
end
