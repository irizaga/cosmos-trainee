# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/stars', type: :request do
  let(:valid_attributes) do
    {
      name: 'Sun',
      mass: 1.0,
      distance_from_earth: 1.0,
      category: :G
    }
  end

  let(:invalid_attributes) do
    {
      name: 'Sun',
      mass: 1.0,
      distance_from_earth: 'far away'
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Star.create! valid_attributes
      get stars_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      star = Star.create! valid_attributes
      get star_url(star)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_star_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      star = Star.create! valid_attributes
      get edit_star_url(star)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Star' do
        expect do
          post stars_url, params: { star: valid_attributes }
        end.to change(Star, :count).by(1)
      end

      it 'redirects to the created star' do
        post stars_url, params: { star: valid_attributes }
        expect(response).to redirect_to(star_url(Star.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Star' do
        expect do
          post stars_url, params: { star: invalid_attributes }
        end.to change(Star, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post stars_url, params: { star: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          name: 'Sol'
        }
      end

      it 'updates the requested star' do
        star = Star.create! valid_attributes
        patch star_url(star), params: { star: new_attributes }
        star.reload
        expect(star.name).to eq('Sol')
      end

      it 'redirects to the star' do
        star = Star.create! valid_attributes
        patch star_url(star), params: { star: new_attributes }
        star.reload
        expect(response).to redirect_to(star_url(star))
      end
    end

    context 'with invalid parameters' do
      it 'renders an error response' do
        star = Star.create! valid_attributes
        patch star_url(star), params: { star: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested star' do
      star = Star.create! valid_attributes
      expect do
        delete star_url(star)
      end.to change(Star, :count).by(-1)
    end

    it 'redirects to the stars list' do
      star = Star.create! valid_attributes
      delete star_url(star)
      expect(response).to redirect_to(stars_url)
    end
  end
end
