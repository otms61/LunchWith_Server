json.error 1
json.message "you have other coupon"
json.coupon do
  json.name @user.coupon.contents
  json.id @user.coupon.id
  json.store_name @user.coupon.store.name
  json.address @user.coupon.store.address
  json.limit @user.coupon.limit.to_i
  json.usage_time do 
    json.from @user.coupon.usage_time_from.to_i
    json.to @user.coupon.usage_time_to.to_i
  end
  json.friends @friends do |friend|
    json.name friend.name
    json.image_url friend.facebook_img
  end
end
