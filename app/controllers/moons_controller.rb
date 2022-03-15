# frozen_string_literal: true

class MoonsController < ApplicationController
  before_action :set_moon, only: %i[show edit update destroy]

  def index
    @moons = Moon.order(:id).page(params[:page])
  end

  def show; end

  def new
    @moon = Moon.new
  end

  def edit; end

  def create
    @moon = Moon.new(moon_params)

    if @moon.save
      redirect_to @moon, notice: 'Moon was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @moon.update(moon_params)
      redirect_to @moon, notice: 'Moon was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @moon.destroy
    redirect_to moons_url, notice: 'Moon was successfully destroyed.'
  end

  private

  def set_moon
    @moon = Moon.find(params[:id])
  end

  def moon_params
    params
      .require(:moon)
      .permit(:name, :mass, :planet_id, :distance_from_planet, :orbital_period, :tidally_locked)
  end
end
