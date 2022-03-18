# frozen_string_literal: true

class DashboardsController < ApplicationController
  def show
    @stars = Star.includes(:planets, :moons).all
    @planets = Planet.all
    @moons = Moon.all

    @habitable_candidates = HabitableCandidates.call(@stars)
    @habitable_zones = HabitableZones.call(@planets)
    @most_recent_systems = MostRecent.call(@stars)
    @heaviest_systems = HeaviestSystems.call(@stars)
    @closest_summary = ClosestSummary.call(@stars)
  end
end
