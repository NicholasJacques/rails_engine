class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    merchant = Merchant.find(params[:merchant_id])

    if params[:date]
      @revenue = merchant.date_revenue(params[:date])
      # find revenue from a specific date
    else
      @revenue = merchant.revenue
    end
    render json: @revenue, serializer: MerchantRevenueSerializer
  end

end