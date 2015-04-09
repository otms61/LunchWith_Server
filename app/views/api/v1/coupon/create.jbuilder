json.success 1
json.coupon do
  json.name @coupon.contents
  json.id @coupon.id
  json.store_name @coupon.store.name
  json.address @coupon.store.address
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