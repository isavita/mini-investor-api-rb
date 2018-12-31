# frozen_string_literal: true

class CampaignsController < ApplicationController
  def index
    campaigns = Campaign.order(:id).page(page).per(page_size)

    render json: extended_json(campaigns)
  end

  def show
    campaign = Campaign.find(params[:id])

    render json: CampaignSerializer.render(campaign)
  end

  private

  def page
    params[:page] || 1
  end

  def page_size
    params[:pageSize] || 12
  end

  def extended_json(campaigns)
    campaigns_json = CampaignSerializer.render_as_json(campaigns)
    { 'data' => { 'campaigns' => campaigns_json }, 'meta' => pagination_info(campaigns) }
  end

  def pagination_info(campaigns)
    {
      'page' => campaigns.current_page,
      'pageSize' => campaigns.size,
      'totalEntries' => campaigns.total_count,
      'totalPages' => campaigns.total_pages
    }
  end
end
