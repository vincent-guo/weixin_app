class User < ActiveRecord::Base
	has_and_belongs_to_many :cards, join_table: "cards_users"
end
