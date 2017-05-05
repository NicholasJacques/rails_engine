class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    @revenue = Merchant.find(params[:merchant_id]).revenue
    render json: @revenue, serializer: MerchantRevenueSerializer
  end

end