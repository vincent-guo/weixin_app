class WeixinsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :check_weixin_legality

  def show
    render :text => params[:echostr]
  end

  def create
    message_type = params[:xml][:MsgType]
    if message_type == "text"
      render "echo", :formats => :xml
    elsif message_type == "location"
      render "location", :formats => :xml
    elsif message_type == "event"
      if params[:xml][:Event] == 'CLICK'
        if params[:xml][:EventKey] == 'menu_deals'
          menu_deals
          render "menu_deals", :formats => :xml
        end
      end
      
    end
  end

  private
  def check_weixin_legality
    array = [Rails.configuration.weixin_token, params[:timestamp], params[:nonce]].sort
    render :text => "Forbidden", :status => 403 if params[:signature] != Digest::SHA1.hexdigest(array.join)
  end

  def menu_deals
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
  end
end