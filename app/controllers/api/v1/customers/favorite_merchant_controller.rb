class Api::V1::Customers::FavoriteMerchantController < ApplicationController

  def show
    render json: Customer.favorite_customer(params[:customer_id])
  end

end
