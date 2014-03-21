require 'rest_client'
require 'net/http'
require 'open-uri'
require 'digest/md5' 

class DianpingsController < ApplicationController

    def get_deals
        apiUrl = 'http://api.dianping.com/v1/deal/find_deals'

        request_params={
            'city'  =>  '北京',
            #'latitude'  =>  latitude,
            #'longitude'  =>  longitude,
            #'radius'  =>  radius,
            #'region'  =>  region,
            #'category'  =>  '美食',
            #'is_local'  =>  is_local,
            #'keyword'  =>  keyword,
            #'sort'  =>  1,
            'limit'  =>  10,
            'page'  => 1,
            'format'  =>  'json'
        }
        @url = apiUrl + "?" + request_params.merge(:sign => gen_sign(request_params), :appkey => Rails.configuration.dianping_appkey).to_param

        resp = nil
        resp = RestClient.get @url

        result = resp.body

        deals_result_hash = JSON.parse(result)


        puts '1111111'
        puts deals_result_hash["status"]
        @total_count = deals_result_hash["total_count"]
        @count = deals_result_hash["count"]
        puts '2222222'
        @deals = deals_result_hash["deals"]

        render :formats => :xml
    end

	def find_businesses
        page = params[:page] ? params[:page] : 1 
        latitude = params[:latitude]
        longitude = params[:longitude]

		apiUrl = "http://api.dianping.com/v1/business/find_businesses"

		request_params={
                #'category'  =>  '美食',
				#'city'  =>  '上海',
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

        render :layout => false
	end

    def get_user
        apiUrl = "https://api.weixin.qq.com/cgi-bin/user/info"
        request_params={
          'access_token' => "RH9zBwnt0jmezAOUkZAiXcVaWgGh4gPBFCPR9fIdrpv_8viQIQ8D-nf5DLZ3i1LqaFsS6N3GmZHuoBXqXAP5iQHKR1cCm5qt8YHUSPyICbiQQ0Oqkn5DUdHxVY_KirFlfip-kwX0_XImfXJBTaZtcw",
          'openid' => "otqutuCpZFM1RsJni84_x7hoTbdE",
          'lang' => "zh_CN"}
        
        @url = apiUrl + "?" + request_params.to_param
        
        resp = nil
        resp = Net::HTTP.get_response(URI(@url))

        result = resp.body

        puts result

        result_hash = JSON.parse(result)

        if result_hash["errcode"]
            puts result_hash["errcode"].to_s
            puts result_hash["errmsg"]
            weixin_user = WeixinUser.new 
        else
            weixin_user = WeixinUser.new(result_hash)
        end

        render :json => weixin_user
    end

    def get_nearby
#http://api.map.baidu.com/geosearch/v3/nearby?location=121.42769622802734%2C31.18268013000488&radius=1500&q=&geotable_id=54809&ak=eCGRx5IWXn9itDezDtYCkdkC&sn=90f9d08c100664426deaa7df57902fd2
#/geosearch/v3/nearby?ak=eCGRx5IWXn9itDezDtYCkdkC&geotable_id=54809&location=121.42769622802734%252C31.18268013000488&radius=1500mtT3UnvLwK600mw0ViGPBzFGe3DqCstefe1fd77c6ff5ef995a4ecbaf3038de23
        ak = 'eCGRx5IWXn9itDezDtYCkdkC'
        sk = 'mtT3UnvLwK600mw0ViGPBzFGe3DqCste'
        url = '/geosearch/v3/nearby'
        $querystring_arrays
        method = 'GET'

        request_params={
                'location'  =>  '121.42769622802734,31.18268013000488',
                'radius'  =>  1500,
                'geotable_id'  =>  54809,
                'ak'  =>  'eCGRx5IWXn9itDezDtYCkdkC'
                }
                
        url = url + "?" + request_params.to_param

        puts url
        str = CGI::escape(url + sk)

        puts str
        md5_str = Digest::MD5.hexdigest(str)
        puts md5_str

        resp = nil
        resp = Net::HTTP.get_response(URI('http://api.map.baidu.com' + url + '&sn=' + md5_str))

        @result = resp.body
    end

	private
	def gen_sign(params)
        array = []
        params.keys.sort.each {|k| array << "#{k}#{params[k]}"}
        Digest::SHA1.hexdigest(Rails.configuration.dianping_appkey.to_s + array.join("") + Rails.configuration.dianping_secret).upcase
    end
    
end