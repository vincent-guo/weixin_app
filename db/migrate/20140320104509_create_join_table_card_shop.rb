class CreateJoinTableCardShop < ActiveRecord::Migration
  def change
    create_join_table :cards, :shops do |t|
    	t.index [:card_id, :shop_id]
        t.index [:shop_id, :card_id]
    end
  end
end
