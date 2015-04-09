json.times @user.matching_times do |time|
  json.from time.from.to_i
  json.to time.to.to_i
end