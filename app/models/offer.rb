class Offer < ApplicationRecord
  validates :advertiser_name, presence: true, uniqueness: true
  validates :url, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :starts_at, presence: true
end
