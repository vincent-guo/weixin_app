class Shop < ActiveRecord::Base
	self.table_name = 't_shop_public_info'
	has_and_belongs_to_many :cards, join_table: "cards_shops"
end
