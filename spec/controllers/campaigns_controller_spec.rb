# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CampaignsController, type: :controller do
  let(:campaign) { create(:campaign, target_amount: 1_000, raised_amount: 100) }

  before { campaign }

  describe 'GET #index' do
    it 'returns a success response with correct entries' do
      get :index, params: {}

      hash_body = JSON.parse(response.body)

      expect(response).to be_successful
      expect(hash_body['data']['campaigns'].size).to be_eql(1)
    end

    context 'with `page` and `pageSize` params' do
      let!(:another_campaign) { create(:campaign, target_amount: 1_000, raised_amount: 200) }

      it 'returns a success response with correct entries' do
        get :index, params: { page: 2, pageSize: 1 }

        hash_body = JSON.parse(response.body)

        expect(response).to be_successful
        expect(hash_body).to match(
          'data' => {
            'campaigns' => [{
              'id' => another_campaign.id,
              'name' => another_campaign.name,
              'imageUrl' => another_campaign.image_url,
              'targetAmount' => another_campaign.target_amount_pennies,
              'raisedAmount' => another_campaign.raised_amount_pennies,
              'multiplierAmount' => another_campaign.multiplier_amount_pennies,
              'raisedPercentage' => '20.0',
              'sector' => another_campaign.sector,
              'countryName' => another_campaign.country_name
            }]
          },
          'meta' => {
            'page' => 2,
            'pageSize' => 1,
            'totalPages' => 2,
            'totalEntries' => 2
          }
        )
      end
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: campaign.id }

      hash_body = JSON.parse(response.body)

      expect(response).to be_successful
      expect(hash_body).to match(
        'id' => campaign.id,
        'name' => campaign.name,
        'imageUrl' => campaign.image_url,
        'targetAmount' => campaign.target_amount_pennies,
        'raisedAmount' => campaign.raised_amount_pennies,
        'multiplierAmount' => campaign.multiplier_amount_pennies,
        'raisedPercentage' => '10.0',
        'sector' => campaign.sector,
        'countryName' => campaign.country_name
      )
    end
  end
end
