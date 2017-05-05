class MerchantRevenueSerializer < ActiveModel::Serializer
  attributes :revenue

  def revenue
    (object / 100.to_f).to_s
  end
end
