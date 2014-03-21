class CreateCards < ActiveRecord::Migration
  def change
    create_table :t_card_info do |t|
      t.string :card_name
      t.string :card_logo
      t.string :card_publisher
      t.integer :shops_maxcount
      t.text :card_intro
      t.string :website
      t.datetime :create_time
      
    end
  end
end
