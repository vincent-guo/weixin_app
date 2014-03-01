class DianpingsController < ApplicationController

	def find_businesses
        page = params[:page]
        latitude = params[:latitude]
        longitude = params[:longitude]

		apiUrl = "http://api.dianping.com/v1/business/find_businesses"

		request_params={'category'  =>  '美食',
				'city'  =>  '上海',
				'latitude'  =>  latitude,
				'longitude'  =>  longitude,
				'sort'  =>  7,
				'limit'  =>  10,
				'offset_type'  =>  1,
				'out_offset_type'  =>  1,
				'platform'  =>  2,
                'page'  => page}
		
		@url = apiUrl + "?" + request_params.merge(:sign => gen_sign(request_params), :appkey => Rails.configuration.dianping_appkey).to_param

		resp = nil
		resp = Net::HTTP.get_response(URI(@url))

        result = resp.body

        #find_business = FindBusiness.new
        #find_business.from_json(result)

        find_business = JSON.parse(result)


        puts '1111111'
        puts find_business["status"]
        @total_count = find_business["total_count"]
        puts find_business["count"]
        puts '2222222'
 #       puts find_business["businesses"]

        @businesses = Array.new

        find_business["businesses"].each do |business|
            new_business = Business.new(business)
            @businesses.push(new_business)  
            puts new_business.regions
            puts '----------------------------'
=begin
            #business.from_json(json)
            puts new_business.business_id
            puts '333333333333333'
            puts new_business.regions
            puts '----------------------------'
=end
        end


















        #status = find_business[:status]

        #puts 'status:' + status

        #json_str = params[:table_option]


        #@result = '{"business": {"business_id": 4719819, "name": "露特餐厅(这是一条测试商户数据，仅用于测试开发，开发完成后请申请正式数据...)", "address": "徐汇区中山西路3031号""}}'
        #@business = Business.new(business_params) 
        #business.from_json(@result)
        #puts business.business_id
        #puts business.name
        #puts business.address


        #find_business = FindBusiness.new
        #find_business.from_json(@result)
        #@businesses = find_business.businesses

		#result = {"business_id": 4719819, "name": "露特餐厅(这是一条测试商户数据，仅用于测试开发，开发完成后请申请正式数据...)", "address": "徐汇区中山西路3031号""}

=begin
        params = ActionController::Parameters.new({
  business: {
    business_id: 4719819,
    name:  '露特餐厅(这是一条测试商户数据，仅用于测试开发，开发完成后请申请正式数据...)',
    address: '徐汇区中山西路3031号'
  }
})
        json = {
    business_id: 4719819,
    name:  '露特餐厅(这是一条测试商户数据，仅用于测试开发，开发完成后请申请正式数据...)',
    address: '徐汇区中山西路3031号',
    regions: [
                "徐汇区", 
                "徐家汇"
            ], 
    categories: [
                "本帮菜"
            ]}.to_json
        puts '111111111111111'
        puts json
		puts '222222222222222'
        business = Business.new
		business.from_json(json)
		puts business.business_id
		puts '333333333333333'
        puts business.regions
#		permitted = params.require(:business).permit(:business_id, :name, :address)

#		puts permitted
=end

	end

	private
	def gen_sign(params)
        array = []
        params.keys.sort.each {|k| array << "#{k}#{params[k]}"}
        Digest::SHA1.hexdigest(Rails.configuration.dianping_appkey.to_s + array.join("") + Rails.configuration.dianping_secret).upcase
    end
    
end