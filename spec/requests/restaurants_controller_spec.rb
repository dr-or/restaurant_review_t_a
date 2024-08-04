require 'rails_helper'

RSpec.describe 'RestaurantsControllers', type: :request do
  describe 'GET /index' do
    subject(:get_restaurants) { get restaurants_path, params: }

    let!(:restaurant) { create(:restaurant) }
    let(:params) { {} }

    it 'returns all restaurants' do
      get_restaurants
      expect(response_body[:restaurants].size).to eq 1
    end

    context 'with review_photo in params' do
      let(:params) { { review_photo: true } }

      let(:restaurant_w_review) { create(:restaurant) }
      let(:review) { create(:review, restaurant: restaurant_w_review) }
      let(:expected_json) do
        {
          restaurants: [{
            id: restaurant_w_review.id
          }],
          total: 1
        }
      end

      before do
        create(:image, target: review)
        get_restaurants
      end

      it 'returns restaurants with photos in reviews' do
        expect(response_body).to include_json(expected_json)
      end
    end

    context 'with average_bill in params' do
      let(:cheap_restaurant) { create(:restaurant) }
      let(:expensive_restaurant) { create(:restaurant) }

      before do
        create(:order, price: 1_000, restaurant: cheap_restaurant)
        create(:order, price: 5_000, restaurant:)
        create(:order, price: 10_000, restaurant: expensive_restaurant)
        get_restaurants
      end

      context 'when more than average orders price' do
        let(:params) { { average_bill: { more: 5_000 } } }
        let(:expected_json) do
          {
            restaurants: [{
              id: expensive_restaurant.id
            }],
            total: 1
          }
        end

        it 'returns expensive restaurants' do
          expect(response_body).to include_json(expected_json)
        end
      end

      context 'when less than average orders price' do
        let(:params) { { average_bill: { less: 5_000 } } }
        let(:expected_json) do
          {
            restaurants: [{
              id: cheap_restaurant.id
            }],
            total: 1
          }
        end

        it 'returns expensive restaurants' do
          expect(response_body).to include_json(expected_json)
        end
      end

      context 'when param equals average orders price' do
        let(:params) { { average_bill: { eq: 5_000 } } }
        let(:expected_json) do
          {
            restaurants: [{
              id: restaurant.id
            }],
            total: 1
          }
        end

        it 'returns expensive restaurants' do
          expect(response_body).to include_json(expected_json)
        end
      end
    end
  end

  private

  def response_body
    JSON.parse(response.body, symbolize_names: true)
  end
end
