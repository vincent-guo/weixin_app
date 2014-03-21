class CreateShops < ActiveRecord::Migration
  def change
    create_table :t_shop_public_info do |t|
      t.string :shop_name
      t.string :shop_logo
      t.string :phone
      t.string :category
      t.string :province
      t.string :city
      t.string :district
      t.string :address
      t.float :lat
      t.float :lng
      t.string :website
      t.string :card_type
      t.integer :business_id
      t.datetime :last_update_time
      t.datetime :create_time

    end
  end
end
