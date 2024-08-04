require 'rails_helper'

RSpec.describe "RestaurantsControllers", type: :request do
  describe "GET /index" do
    subject(:get_restaurants) { get restaurants_path, params: params }

    # let(:restaurant) { create(:restaurant) }

    before do
      create(:restaurant)
      get_restaurants
    end

    context 'without params' do
      let(:params) { {} }

      it 'returns all restaurants' do
        expect(response_body[:restaurants].size).to eq 1
      end
    end
  end

  private

  def response_body
    JSON.parse(response.body, symbolize_names: true)
  end
end
