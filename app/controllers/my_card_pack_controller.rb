class MyCardPackController < ApplicationController
	def show
		@user = User.find(params[:user_id])
		@cards = @user.cards
	end

  # GET /my_card_pack/add
	def add
		@user = User.find(params[:user_id])
		@cards = Card.where.not(id: @user.cards.ids)
	end

  # POST /my_card_pack/added
	def added
		@user = User.find(params[:user_id])
		#@user.cards << Card.find(params[:id])
		card = Card.find(params[:id])
		@user.cards.push(card)
		@user.save
		redirect_to action: 'show', user_id: params[:user_id]
	end

   # DELETE /my_card_pack/added
	def destroy
		@user = User.find(params[:user_id])
		card = Card.find(params[:id])
		@user.cards.delete(card)
		@user.save
		redirect_to action: 'show', user_id: params[:user_id]
	end
end