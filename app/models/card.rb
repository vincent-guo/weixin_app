class Card < ActiveRecord::Base
	self.table_name = 't_card_info'
	has_and_belongs_to_many :shops, join_table: "cards_shops"
	has_and_belongs_to_many :users, join_table: "cards_users"
end
