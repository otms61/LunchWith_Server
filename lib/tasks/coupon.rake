namespace :coupon do
  desc 'クーポンの取得者数の表示'
  task :static => :environment do
    coupons = Coupon.where(status: 'active')
    coupons.each do |coupon|
      pp "#{coupon.id}: #{coupon.users.length}"
    end
  end

  desc 'クーポンの取得者の情報'
  task :users, ['coupon_id'] => :environment do |task, args|
    coupon = Coupon.find(args.coupon_id)
    coupon.users.each do |user|
      friend_ids = coupon.get_user_friends(user).map(&:id)
      pp "#{user.id}: #{friend_ids}"
    end
  end 

  desc 'マッチングの実行'
  task :do_matching, ['coupon_id'] => :environment do |task, args|
    coupon = Coupon.find(args.coupon_id)
    coupon.do_matching
  end

  desc '取得期限を超えたクーポンのマッチング'
  task :check_limit => :environment do
    now = Time.now
    coupons = Coupon.where(status: 'active').select { |c| c.limit <  now }
    coupons.each do |coupon|
      Rake::Task['coupon:do_matching'].invoke(coupon.id)
      coupon.update_attributes(status: :archived)
    end
  end

end
