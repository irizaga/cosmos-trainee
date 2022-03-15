# frozen_string_literal: true

class PlanetsController < ApplicationController
  before_action :set_planet, only: %i[show edit update destroy]

  def index
    @planets = Planet.order(:id).page(params[:page])
  end

  def show; end

  def new
    @planet = Planet.new
  end

  def edit; end

  def create
    @planet = Planet.new(planet_params)

    if @planet.save
      redirect_to @planet, notice: 'Planet was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @planet.update(planet_params)
      redirect_to @planet, notice: 'Planet was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @planet.destroy
    redirect_to planets_url, notice: 'Planet was successfully destroyed.'
  end

  private

  def set_planet
    @planet = Planet.find(params[:id])
  end

  def planet_params
    params
      .require(:planet)
      .permit(:name, :mass, :star_id, :tidally_locked, :distance_from_star, :orbital_period, :category)
  end
end
