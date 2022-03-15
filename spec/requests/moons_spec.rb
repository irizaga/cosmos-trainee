# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/moons', type: :request do
  let(:star) do
    Star.create(
      name: 'Sun',
      mass: 1.0,
      distance_from_earth: 1.0
    )
  end

  let(:planet) do
    Planet.create(
      name: 'Earth',
      mass: 1.0,
      distance_from_star: 1.0,
      orbital_period: 365,
      tidally_locked: false,
      category: :rocky,
      star_id: star.id
    )
  end

  let(:valid_attributes) do
    {
      name: 'Moon',
      mass: 0.03,
      distance_from_planet: 0.06,
      orbital_period: 28,
      tidally_locked: true,
      planet_id: planet.id
    }
  end

  let(:invalid_attributes) do
    {
      name: 'Moon',
      mass: nil,
      distance_from_star: 0.06,
      orbital_period: 28,
      tidally_locked: true,
      planet_id: planet.id
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Moon.create! valid_attributes
      get moons_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      moon = Moon.create! valid_attributes
      get moon_url(moon)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_moon_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      moon = Moon.create! valid_attributes
      get edit_moon_url(moon)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Moon' do
        expect do
          post moons_url, params: { moon: valid_attributes }
        end.to change(Moon, :count).by(1)
      end

      it 'redirects to the created moon' do
        post moons_url, params: { moon: valid_attributes }
        expect(response).to redirect_to(moon_url(Moon.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Moon' do
        expect do
          post moons_url, params: { moon: invalid_attributes }
        end.to change(Moon, :count).by(0)
      end

      it 'renders an error response' do
        post moons_url, params: { moon: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          name: 'Luna'
        }
      end

      it 'updates the requested moon' do
        moon = Moon.create! valid_attributes
        patch moon_url(moon), params: { moon: new_attributes }
        moon.reload
        expect(moon.name).to eq('Luna')
      end

      it 'redirects to the moon' do
        moon = Moon.create! valid_attributes
        patch moon_url(moon), params: { moon: new_attributes }
        moon.reload
        expect(response).to redirect_to(moon_url(moon))
      end
    end

    context 'with invalid parameters' do
      it 'renders an error response' do
        moon = Moon.create! valid_attributes
        patch moon_url(moon), params: { moon: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested moon' do
      moon = Moon.create! valid_attributes
      expect do
        delete moon_url(moon)
      end.to change(Moon, :count).by(-1)
    end

    it 'redirects to the moons list' do
      moon = Moon.create! valid_attributes
      delete moon_url(moon)
      expect(response).to redirect_to(moons_url)
    end
  end
end
