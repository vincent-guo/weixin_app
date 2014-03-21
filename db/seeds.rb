# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Shop.create(shop_name: '功德林素菜饭庄', shop_logo:'http://www.joiest.com/upload_files/customer/1_20131122151151_MQ==.jpg', 
	phone: '010-65283987', category: '餐饮美食', province: '北京市', city: '北京市', district: '东城区', 
	address: '北京市东城区前门东大街甲2号', website: '', card_type: '中欣卡')
Shop.create(shop_name: '贵友大厦建国门店', shop_logo:'', 
	phone: '65629175', category: '百货', province: '北京市', city: '北京市', district: '朝阳区', 
	address: '朝阳区建外大街甲5号', website: 'http://www.newyansha.com.cn/chinese/guiyou.htm', card_type: '连心卡')
Shop.create(shop_name: '元祖食品沪南路店', shop_logo:'http://www.nsdkj.com.cn/uploads/business/business_5780.jpg', 
	phone: '20247218', category: '餐饮美食', province: '上海市', city: '上海市', district: '浦东新区', 
	address: '沪南路858号', website: '', card_type: '纽斯达卡')
Shop.create(shop_name: '百盛购物中心（万象店）', shop_logo:'http://114.255.22.53/outs/2013/01/11/20130111120025750321_L.jpg', 
	phone: '0771―3915188', category: '百货超市', province: '广西壮族自治区', city: '南宁市', district: '青秀区', 
	address: '南宁市青秀区136号南宁华润中心万象城', website: 'http;//www.parkson.com.cn', card_type: '商通卡,实名VIP商通,福利卡,桂林旅游卡,三星联名卡')