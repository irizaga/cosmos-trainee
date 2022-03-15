# frozen_string_literal: true

class StarsController < ApplicationController
  before_action :set_star, only: %i[show edit update destroy]

  def index
    @stars = Star.order(:id).page(params[:page])
  end

  def show; end

  def new
    @star = Star.new
  end

  def edit; end

  def create
    @star = Star.new(star_params)

    if @star.save
      redirect_to @star, notice: 'Star was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @star.update(star_params)
      redirect_to @star, notice: 'Star was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @star.destroy
    redirect_to stars_url, notice: 'Star was successfully destroyed.'
  end

  private

  def set_star
    @star = Star.find(params[:id])
  end

  def star_params
    params
      .require(:star)
      .permit(:name, :mass, :distance_from_earth, :category)
  end
end
