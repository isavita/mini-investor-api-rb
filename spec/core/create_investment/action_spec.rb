# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateInvestment::Action do
  subject { described_class.new(campaign_id: campaign.id, amount_pennies: amount).call }

  let(:campaign) { create(:campaign) }
  let(:amount) { 200 }

  context 'with valid amount' do
    it 'creates a new investment for the given campaign and amount' do
      expect { subject }.to change {
        Investment.where(campaign: campaign, amount_pennies: amount).count
      }.from(0).to(1)
    end
  end

  context 'with negative amoun' do
    let(:amount) { -200 }

    it 'raises an error' do
      expect { subject }.to raise_error(CreateInvestment::Validator::NegativeAmountError)
    end
  end

  context 'with amount not multiple of the campaign `multiplier_amount`' do
    let(:amount) { 201 }

    it 'raises an error' do
      expect { subject }.to raise_error(CreateInvestment::Validator::IncorrectAmountError)
    end
  end
end
