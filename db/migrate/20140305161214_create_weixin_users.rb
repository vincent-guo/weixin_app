class CreateWeixinUsers < ActiveRecord::Migration
  def change
    create_table :weixin_users do |t|
      t.integer :subscribe
      t.string :openid
      t.string :nickname
      t.integer :sex
      t.string :language
      t.string :city
      t.string :province
      t.string :country
      t.string :headimgurl
      t.integer :subscribe_time

      t.timestamps
    end
  end
end
