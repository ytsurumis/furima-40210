class Furima < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition 
  belongs_to :burden
  belongs_to :area
  belongs_to :number_of_day

  validates :title, :description, :price, presence: true
  validates :category_id,numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,numericality: { other_than: 1 , message: "can't be blank"}
  validates :burden_id,numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id,numericality: { other_than: 1 , message: "can't be blank"}
  validates :number_of_day_id,numericality: { other_than: 1 , message: "can't be blank"}
end
