class Business < ActiveRecord::Base
#  has_many :deals, dependent: :destroy

  attr_accessor :regions, :categories, :deals

=begin
    attr_accessor :business_id, 
    :name, 
    :branch_name, 
    :address, 
    :telephone, 
    :city, 
    :regions, 
    :categories, 
    :latitude, 
    :longitude, 
    :avg_rating, 
    :rating_img_url, 
    :rating_s_img_url, 
    :product_grade, 
    :decoration_grade, 
    :service_grade, 
    :product_score, 
    :decoration_score, 
    :service_score, 
    :avg_price, 
    :review_count, 
    :distance, 
    :business_url, 
    :photo_url, 
    :s_photo_url,
    :has_coupon,
    :coupon_id,
    :coupon_description,
    :coupon_url,
    :has_deal,
    :deal_count,
    :deals,
    :has_online_reservation, 
    :online_reservation_url
=end
end
