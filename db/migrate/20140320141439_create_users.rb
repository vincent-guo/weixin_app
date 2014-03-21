class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :subscribe
      t.string :openid
      t.string :nickname
      t.integer :sex
      t.string :language
      t.string :city
      t.string :province
      t.string :country
      t.string :headimgurl
      t.datetime :subscribe_time

      t.timestamps
    end
  end
end
