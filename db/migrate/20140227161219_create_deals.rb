class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals, :id => false do |t|
      t.string :id
      t.string :description
      t.string :url
      t.integer :business_id

      t.timestamps
    end
  end
end
