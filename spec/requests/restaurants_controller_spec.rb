require 'rails_helper'

RSpec.describe 'RestaurantsControllers', type: :request do
  describe 'GET /index' do
    subject(:get_restaurants) { get restaurants_path, params: }

    # let(:restaurant) { create(:restaurant) }
    let(:params) { {} }

    before do
      create(:restaurant)
    end

    it 'returns all restaurants' do
      get_restaurants
      expect(response_body.size).to eq 1
    end

    context 'with review_photo in params' do
      let(:params) { { review_photo: true } }

      let(:restaurant_w_review) { create(:restaurant) }
      let(:review) { create(:review, restaurant: restaurant_w_review) }

      before do
        create(:image, target: review)
        get_restaurants
      end

      it 'returns correct amount of restaurants' do
        expect(response_body.size).to eq 1
      end

      it 'returns restaurants with photos in reviews' do
        expect(response_body.first[:id]).to eq restaurant_w_review.id
      end
    end
  end

  private

  def response_body
    JSON.parse(response.body, symbolize_names: true)[:restaurants]
  end
end
