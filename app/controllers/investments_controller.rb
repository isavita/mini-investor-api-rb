# frozen_string_literal: true

class InvestmentsController < ApplicationController
  def create
    investment = CreateInvestment::EntryPoint.call(campaign_id: params[:campaignId], amount: params[:amount])

    render json: InvestmentSerializer.render(investment), status: :created
  end
end
