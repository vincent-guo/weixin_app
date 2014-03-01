class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.integer :business_id 
      t.string :name 
      t.string :branch_name 
      t.string :address 
      t.string :telephone 
      t.string :city 
#    :regions 
#    :categories 
      t.float :latitude 
      t.float :longitude 
      t.float :avg_rating 
      t.string :rating_img_url 
      t.string :rating_s_img_url 
      t.integer :product_grade 
      t.integer :decoration_grade 
      t.integer :service_grade 
      t.float :product_score 
      t.float :decoration_score 
      t.float :service_score 
      t.integer :avg_price 
      t.integer :review_count 
      t.integer :distance 
      t.string :business_url 
      t.string :photo_url 
      t.string :s_photo_url
      t.integer :has_coupon
      t.integer :coupon_id
      t.string :coupon_description
      t.string :coupon_url
      t.integer :has_deal
      t.integer :deal_count
#    :deals
      t.integer :has_online_reservation 
      t.string :online_reservation_url

      t.timestamps
    end
  end
end
