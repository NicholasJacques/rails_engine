class Api::V1::Items::FindController < ApplicationController

  def show
    render json: Item.order(id: :asc).find_by(item_params)
  end

  def index
    render json: Item.where(item_params)
  end

  private

  def item_params
    params[:unit_price] = (params[:unit_price].to_f * 100).round if params[:unit_price]
    params.permit(:id,
                  :name,
                  :description,
                  :unit_price,
                  :merchant_id,
                  :created_at,
                  :updated_at)
  end
end
