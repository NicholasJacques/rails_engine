class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    @revenue = Merchant.revenue_by_date(params[:date])
    render json: @revenue, serializer: TotalRevenueSerializer
  end
end