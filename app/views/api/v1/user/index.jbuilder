json.me do
  json.name @user.name
  json.image_url @user.facebook_img
end
json.status @user.status

if @user.pre_matching? or @user.arrange_time? or @user.post_matching?
  json.my_coupon do
  	json.contents @coupon.contents
  	json.id @coupon.id
  	json.store_name @coupon.store.name
  	json.address @coupon.store.address
  	json.latitude @coupon.store.latitude.to_f
  	json.longitude @coupon.store.longitude.to_f
  	json.tel @coupon.store.tel
  	json.store_image_url @coupon.store.store_image_url
  	json.limit @coupon.limit.to_i
  	json.usage_time do 
  	  json.from @coupon.usage_time_from.to_i
  	  json.to @coupon.usage_time_to.to_i
  	end
  	json.friends @friends do |friend|
  		json.name friend.name
  		json.image_url friend.facebook_img
  	end
  end
else
  json.my_coupon nil
end

if @user.arrange_time? or @user.post_matching?
  json.matching do
    json.name @user.matched_user.name
    json.image_url @user.matched_user.facebook_img
    json.time_from @user.matching.from.to_i
    json.time_to @user.matching.to.to_i
  end
else
  json.matching nil
end