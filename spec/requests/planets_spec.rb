# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/planets', type: :request do
  let(:star) do
    Star.create(
      name: 'Sun',
      mass: 1.0,
      distance_from_earth: 1.0
    )
  end

  let(:valid_attributes) do
    {
      name: 'Earth',
      mass: 1.0,
      distance_from_star: 1.0,
      orbital_period: 365,
      tidally_locked: false,
      category: :rocky,
      star_id: star.id
    }
  end

  let(:invalid_attributes) do
    {
      mass: nil,
      distance_from_star: 1.0,
      orbital_period: 365,
      tidally_locked: false,
      category: :rocky,
      star: star
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Planet.create! valid_attributes
      get planets_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      planet = Planet.create! valid_attributes
      get planet_url(planet)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_planet_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      planet = Planet.create! valid_attributes
      get edit_planet_url(planet)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Planet' do
        expect do
          post planets_url, params: { planet: valid_attributes }
        end.to change(Planet, :count).by(1)
      end

      it 'redirects to the created planet' do
        post planets_url, params: { planet: valid_attributes }
        expect(response).to redirect_to(planet_url(Planet.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Planet' do
        expect do
          post planets_url, params: { planet: invalid_attributes }
        end.to change(Planet, :count).by(0)
      end

      it 'renders an error response' do
        post planets_url, params: { planet: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          name: 'Earth 2.0'
        }
      end

      it 'updates the requested planet' do
        planet = Planet.create! valid_attributes
        patch planet_url(planet), params: { planet: new_attributes }
        planet.reload
        expect(planet.name).to eq('Earth 2.0')
      end

      it 'redirects to the planet' do
        planet = Planet.create! valid_attributes
        patch planet_url(planet), params: { planet: new_attributes }
        planet.reload
        expect(response).to redirect_to(planet_url(planet))
      end
    end

    context 'with invalid parameters' do
      it 'renders an error response' do
        planet = Planet.create! valid_attributes
        patch planet_url(planet), params: { planet: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested planet' do
      planet = Planet.create! valid_attributes
      expect do
        delete planet_url(planet)
      end.to change(Planet, :count).by(-1)
    end

    it 'redirects to the planets list' do
      planet = Planet.create! valid_attributes
      delete planet_url(planet)
      expect(response).to redirect_to(planets_url)
    end
  end
end
