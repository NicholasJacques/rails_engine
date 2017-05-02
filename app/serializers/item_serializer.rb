class ItemSerializer < ActiveModel::Serializer
  attributes :id, :merchant_id, :description, :name, :unit_price

  def unit_price
    (object.unit_price / 100.to_f).to_s
  end
end
