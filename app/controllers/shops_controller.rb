require 'rest_client'
require 'digest/md5' 

class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  def match
    id = 7
    @shop = Shop.find(id)

    apiUrl = "http://api.dianping.com/v1/business/find_businesses"

    request_params={
                #'category'  =>  '美食',
        'city'  =>  @shop.city,
        'keyword' => @shop.shop_name,
        'limit'  =>  40,
        'platform'  =>  2}
    
    url = apiUrl + "?" + request_params.merge(:sign => gen_sign(request_params), :appkey => Rails.configuration.dianping_appkey).to_param

    resp = nil
    resp = RestClient.get url

    result = resp.body

    find_business = JSON.parse(result)


    puts '1111111'
    puts find_business["status"]
    @total_count = find_business["total_count"]
    puts find_business["count"]
    puts '2222222'

    @businesses = Array.new


    @match_result_array = Array.new(find_business["count"]) { Array.new(6) }
    i = 0

    find_business["businesses"].each do |business|
      new_business = Business.new(business)
      @businesses.push(new_business)  
      puts new_business.regions
      puts '----------------------------'
      if (@shop.shop_name.include?new_business.name) || (new_business.name.include?@shop.shop_name)
        @match_result_array[i][0] = 1
      end

      if (@shop.phone.include?new_business.telephone) || (new_business.telephone.include?@shop.phone)
        @match_result_array[i][1] = 1
      end
      if (@shop.address.include?new_business.address) || (new_business.address.include?@shop.address)
        @match_result_array[i][2] = 1
      end
      if (@shop.city.include?new_business.city) || (new_business.city.include?@shop.city)
        @match_result_array[i][3] = 1
      end
      if new_business.regions.include?(@shop.district)    
        @match_result_array[i][4] = 1
      end
      if new_business.categories.include?(@shop.category)
        @match_result_array[i][5] = 1
      end
    end
  end

  # GET /shops
  # GET /shops.json
  def index
    @shops = Shop.all
  end

  # GET /shops/1
  # GET /shops/1.json
  def show
  end

  # GET /shops/new
  def new
    @shop = Shop.new
  end

  # GET /shops/1/edit
  def edit
  end

  # POST /shops
  # POST /shops.json
  def create
    @shop = Shop.new(shop_params)

    respond_to do |format|
      if @shop.save
        format.html { redirect_to @shop, notice: 'Shop was successfully created.' }
        format.json { render action: 'show', status: :created, location: @shop }
      else
        format.html { render action: 'new' }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shops/1
  # PATCH/PUT /shops/1.json
  def update
    respond_to do |format|
      if @shop.update(shop_params)
        format.html { redirect_to @shop, notice: 'Shop was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @shop }
      else
        format.html { render action: 'edit' }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.json
  def destroy
    @shop.destroy
    respond_to do |format|
      format.html { redirect_to shops_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_params
      params.require(:shop).permit(:shop_name, :shop_logo, :phone, :category, :province, :city, :district, :address, :lat, :lng, :website, :card_type, :business_id, :last_update_time, :create_time)
    end

    def gen_sign(params)
        array = []
        params.keys.sort.each {|k| array << "#{k}#{params[k]}"}
        Digest::SHA1.hexdigest(Rails.configuration.dianping_appkey.to_s + array.join("") + Rails.configuration.dianping_secret).upcase
    end
end
