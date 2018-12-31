# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InvestmentsController, type: :controller do
  describe 'POST #create' do
    let(:params) { { amount: 100, campaignId: campaign.id } }
    let(:campaign) { Campaign.create!(name: 'Company 1', target_amount: 1000) }

    it 'creates a new investment' do
      post :create, params: params, format: :json

      hash_body = JSON.parse(response.body)

      expect(response).to have_http_status(:created)
      expect(hash_body).to include('amount' => params[:amount], 'campaignId' => campaign.id)
    end
  end
end
