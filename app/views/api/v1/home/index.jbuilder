# json.status @user.users_coupons[0].status
json.coupons @coupons do |coupon|
  json.contents coupon.contents
  json.id coupon.id
  json.store_name coupon.store.name
  json.limit coupon.limit.to_i
  json.usage_time do
    json.from coupon.usage_time_from.to_i
    json.to coupon.usage_time_to.to_i
  end
end