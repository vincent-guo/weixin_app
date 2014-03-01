class FindBusiness < ActiveRecord::Base
	has_many :business
	attr_accessor :status, :total_count, :count
end