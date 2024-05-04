class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :user_id, :furima_id, :token, :post_code, :area_id, :municipalities, :street, :building, :phone, :purchase_id

  with_options presence: true do
    validates :user_id
    validates :token
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :area_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    purchase = Purchase.create(user_id: user_id, furima_id: furima_id)
    Shipping.create(post_code: post_code, area_id: area_id, municipalities: municipalities, street: street, building: building, phone: phone, purchase_id: purchase_id)
  end
end