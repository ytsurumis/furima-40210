class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :user_id, :furima_id, :token, :post_code, :area_id, :municipalities, :street, :building, :phone, :purchase_id

  with_options presence: true do
    validates :user_id
    validates :furima_id
    validates :token
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipalities
    validates :street
    validates :phone, length: { in: 10..11, message: 'is too short' }
  end
  validates :phone, numericality: { message: 'is not a number' }
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchase = Purchase.create(user_id:, furima_id:)
    Shipping.create(post_code:, area_id:, municipalities:, street:, building:,
                    phone:, purchase_id: purchase.id)
  end
end
