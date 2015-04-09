Coupon.create!([
  {store_id: 1, university_id: 1, contents: "ＢＩＲＴＨＤＡＹプレート無料！ ☆アイス＆フルーツの盛り合わせ付☆", limit: "2015-02-15 03:10:00", usage_time_from: "2015-02-19 02:00:00", usage_time_to: "2015-02-19 07:00:00"},
  {store_id: 1, university_id: 1, contents: "ランチ50円引き！", limit: "2015-02-15 03:10:00", usage_time_from: "2015-02-19 02:00:00", usage_time_to: "2015-02-19 07:00:00"},
  {store_id: 2, university_id: 1, contents: "【入店時提示で】お会計10％OFF", limit: "2015-02-15 03:10:00", usage_time_from: "2015-02-19 02:00:00", usage_time_to: "2015-02-19 07:00:00"},
  {store_id: 2, university_id: 1, contents: "海鮮チヂミ無料サービス!!", limit: "2015-02-15 03:10:00", usage_time_from: "2015-02-19 02:00:00", usage_time_to: "2015-02-19 07:00:00"},
  {store_id: 3, university_id: 1, contents: "食べ飲み300円OFF！", limit: "2015-02-15 03:10:00", usage_time_from: "2015-02-19 02:00:00", usage_time_to: "2015-02-19 07:00:00"},
  {store_id: 3, university_id: 1, contents: "【ランチ】お会計より15％OFF！", limit: "2015-02-15 03:10:00", usage_time_from: "2015-02-19 02:00:00", usage_time_to: "2015-02-19 07:00:00"}
])
FriendShip.create!([
  {user_id: 1, friend_id: 2},
  {user_id: 2, friend_id: 1}
])
Matching.create!([
  {coupon_id: 1, user1_id: 1, user2_id: 2, from: nil, to: nil}
])
MatchingTime.create!([
  {matching_id: 1, user_id: 1, from: "2015-02-15 03:10:00", to: "2015-02-15 03:10:30"}
])
Message.create!([
  {matching_id: 1, user_id: 1, sequential_id: 1, message: "何時集合？"},
  {matching_id: 1, user_id: 2, sequential_id: 2, message: "10時で!"}
])
Store.create!([
  {name: "焼肉　ビーフマスター", description: "焼肉　ビーフマスター", address: "東京都新宿区西早稲田２-11-13", latitude: "35.709237", longitude: "139.71128", url: "http://hoge.com", tel: "050-5572-7656", store_image_url: "https://s3-ap-northeast-1.amazonaws.com/lunchwith/img/%E3%83%92%E3%82%99%E3%83%BC%E3%83%95%E3%83%9E%E3%82%B9%E3%82%BF%E3%83%BC.jpg"},
  {name: "Hide Out　（ハイドアウト）　早稲田店", description: "Hide Out　（ハイドアウト）　早稲田店", address: "東京都新宿区西早稲田２-5-14　みよしビル2F", latitude: "35.709945", longitude: "139.716202", url: "http://hoge.com", tel: "050-5815-7585", store_image_url: "https://s3-ap-northeast-1.amazonaws.com/lunchwith/img/%E3%83%8F%E3%82%A4%E3%83%89%E3%82%A2%E3%82%A6%E3%83%88.jpg"},
  {name: "Asian　Restaurant　SARATHI（サラディー）", description: "Asian　Restaurant　SARATHI（サラディー）", address: "東京都豊島区高田３-7-17　安斎ビル1階", latitude: "35.713317", longitude: "139.705755", url: "http://hoge.com", tel: "050-5257-8183", store_image_url: "https://s3-ap-northeast-1.amazonaws.com/lunchwith/img/%E3%82%AB%E3%83%AC%E3%83%BC.jpg"}
])
StoresUniversity.create!([
  {store_id: 1, university_id: 1},
  {store_id: 1, university_id: 2}
])
University.create!([
  {name: "早稲田大学(本部キャンパス)", logo_url: "https://s3-ap-northeast-1.amazonaws.com/lunchwith/img/waseda.jpg", description: "hogehoge"},
  {name: "早稲田大学(理工キャンパス)", logo_url: "https://s3-ap-northeast-1.amazonaws.com/lunchwith/img/waseda.jpg", description: "hogehoge"},
  {name: "東京工業大学(大岡山キャンパス)", logo_url: "https://s3-ap-northeast-1.amazonaws.com/lunchwith/img/swallow.jpg", description: "hogehoge"},
  {name: "東京工業大学(すずかけ台キャンパス)", logo_url: "https://s3-ap-northeast-1.amazonaws.com/lunchwith/img/swallow.jpg", description: "hogehoge"},
  {name: "北海道大学", logo_url: "https://s3-ap-northeast-1.amazonaws.com/lunchwith/img/logo.png", description: "hogehoge"},
])
User.create!([
  {facebook_id: "1391097244534679", facebook_token: "CAAW9XnSoox4BADBwwmLmDkNhw4wgRN0ZCSWlRbmtH2qUsi2NQvjPszqe8CP7fxI8QhZCt9xEErZANXTqslTeHZCvdpSqstcO0nOD1vZBLgjcfKMPZCwzuk018d85jCJmIUpWQ2Ship4d25alYG14sGB68yz2MU8sf0sbykFRxqHfUl6eoFwQ0EF9ZASEkFEnivYstg6JzickaB4zaqoQ7dwvUqYhgIueSMZD", access_token: "abc", name: "陸　経路", facebook_img: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xfa1/v/t1.0-1/p50x50/10993405_1392124051098665_1243366470582216707_n.jpg?oh=379c4b007103f3f10d36ccac807b7fcc&oe=55514050&__gda__=1431345366_58899a9788413dd9444a85f0907964a9", device_token: nil, university_id: 1, status: 0},
  {facebook_id: "10", facebook_token: "CAAW9XnSoox4BADBwwmLmDkNhw4wgRN0ZCSWlRbmtH2qUsi2NQvjPszqe8CP7fxI8QhZCt9xEErZANXTqslTeHZCvdpSqstcO0nOD1vZBLgjcfKMPZCwzuk018d85jCJmIUpWQ2Ship4d25alYG14sGB68yz2MU8sf0sbykFRxqHfUl6eoFwQ0EF9ZASEkFEnivYstg6JzickaB4zaqoQ7dwvUqYhgIueSMD", access_token: "8e4a3096696410d6f62c81ff0dd6be97", name: "陸　経路(arrange_time)", facebook_img: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xfa1/v/t1.0-1/p50x50/10993405_1392124051098665_1243366470582216707_n.jpg?oh=379c4b007103f3f10d36ccac807b7fcc&oe=55514050&__gda__=1431345366_58899a9788413dd9444a85f0907964a9", device_token: nil, university_id: 1, status: :arrange_time},
  {facebook_id: "20", facebook_token: "CAAW9XnSoox4BADBwwmLmDkNhw4wgRN0ZCSWlRbmtH2qUsi2NQvjPszqe8CP7fxI8QhZCt9xEErZANXTqslTeHZCvdpSqstcO0nOD1vZBLgjcfKMPZCwzuk018d85jCJmIUpWQ2Ship4d25alYG14sGB68yz2MU8sf0sbykFRxqHfUl6eoFwQ0EF9ZASEkFEnivYstg6JzickaB4zaqoQ7dwvUqYhgIueSZD", access_token: "8e4a3096696410d6f62c81ff0dd6be96", name: "陸　経路(post_arrange_time)", facebook_img: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xfa1/v/t1.0-1/p50x50/10993405_1392124051098665_1243366470582216707_n.jpg?oh=379c4b007103f3f10d36ccac807b7fcc&oe=55514050&__gda__=1431345366_58899a9788413dd9444a85f0907964a9", device_token: nil, university_id: 1, status: :post_arrange_time},
  {facebook_id: "30", facebook_token: "CAAW9XnSoox4BADBwwmLmDkNhw4wgRN0ZCSWlRbmtH2qUsi2NQvjPszqe8CP7fxI8QhZCt9xEErZANXTqslTeHZCvdpSqstcO0nOD1vZBLgjcfKMPZCwzuk018d85jCJmIUpWQ2Ship4d25alYG14sGB68yz2MU8sf0sbykFRxqHfUl6eoFwQ0EF9ZASEkFEnivYstg6JzickaB4zaqoQ7dwvUqYhgIueMZD", access_token: "8e4a3096696410d6f62c81ff0dd6be95", name: "陸　経路(post_matching)", facebook_img: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xfa1/v/t1.0-1/p50x50/10993405_1392124051098665_1243366470582216707_n.jpg?oh=379c4b007103f3f10d36ccac807b7fcc&oe=55514050&__gda__=1431345366_58899a9788413dd9444a85f0907964a9", device_token: nil, university_id: 1, status: :post_matching},
  {facebook_id: "1391097244534680", facebook_token: "CAW9XnSoox4BADBwwmLmDkNhw4wgRN0ZCSWlRbmtH2qUsi2NQvjPszqe8CP7fxI8QhZCt9xEErZANXTqslTeHZCvdpSqstcO0nOD1vZBLgjcfKMPZCwzuk018d85jCJmIUpWQ2Ship4d25alYG14sGB68yz2MU8sf0sbykFRxqHfUl6eoFwQ0EF9ZASEkFEnivYstg6JzickaB4zaqoQ7dwvUqYhgIueSMZD", access_token: "9634e363ac44b7eca5fc3ede639eaba1", name: "海　航路", facebook_img: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xfa1/v/t1.0-1/p50x50/10993405_1392124051098665_1243366470582216707_n.jpg?oh=379c4b007103f3f10d36ccac807b7fcc&oe=55514050&__gda__=1431345366_58899a9788413dd9444a85f0907964a9", device_token: nil, university_id: 1, status: 0},
  {facebook_id: "1391097244534681", facebook_token: "CAAW9XnSox4BADBwwmLmDkNhw4wgRN0ZCSWlRbmtH2qUsi2NQvjPszqe8CP7fxI8QhZCt9xEErZANXTqslTeHZCvdpSqstcO0nOD1vZBLgjcfKMPZCwzuk018d85jCJmIUpWQ2Ship4d25alYG14sGB68yz2MU8sf0sbykFRxqHfUl6eoFwQ0EF9ZASEkFEnivYstg6JzickaB4zaqoQ7dwvUqYhgIueSMZD", access_token: "19d3401ee7bb76c794e7946297f8c629", name: "空　空路", facebook_img: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xfa1/v/t1.0-1/p50x50/10993405_1392124051098665_1243366470582216707_n.jpg?oh=379c4b007103f3f10d36ccac807b7fcc&oe=55514050&__gda__=1431345366_58899a9788413dd9444a85f0907964a9", device_token: nil, university_id: 1, status: 0},
  {facebook_id: "1390719244572466", facebook_token: "CAAW9XnSoox4BACAhZB8eGBeCeNr3334xa7dc6SXlZB7h0sJxm9CTckJZAxvpG8cDMMK5vVEXVZCZBktrZCsOdiwTLKxoGGGSIEZCKsZCDlZBJPAQoZAjDNwnZB5R6KQ8ZAB0oVAbFIJh7aOkaQrp5IQv9g1jNJMYX67HeSd2m401mc72Vb4EEqO2il2ZBEMARLBvl4J7ceZBnMiRZBP0EZCNcc5EGk3WjcF5rOOMD0IZD", access_token: "9e1744641d8274dd35ed800bd9018f2d", name: "海 航路", facebook_img: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xfp1/v/t1.0-1/c15.0.50.50/p50x50/10354686_10150004552801856_220367501106153455_n.jpg?oh=8ab5ec7814307370244b6b8baf61bde4&oe=5583A92F&__gda__=1434999769_e0986db92e8097f1730c10f285e0e501", device_token: nil, university_id: 1, status: 0},
  {facebook_id: "1396162980695027", facebook_token: "CAAW9XnSoox4BACb2IHynvBhRXPPjqqdkjUOhQ6j19iwSBgljzcRgwXUmGjiYKeZAECDpGJxpESoBtdBLZCfGgDCKy2TDnQJeUIyYvV5Q24cxk9Pe81fxDjXBZBgwNeVWdoAOTZCcKbEKZAlyErkMBQZBhcweU4G0ywKA9TOhZAz8aztn4fOdDear7dyu3ptenjidXJVltvKsZCTshMFZCfj9MfE3ZCeZCgSa3IZD", access_token: "27b24a9ef34348fe22a507e8c4c34fd1", name: "石原 さとみ", facebook_img: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xfa1/v/t1.0-1/p50x50/1621947_1396185967359395_7707505951120194122_n.jpg?oh=e7de6e805b9d744208c1b7bf0443b498&oe=5554C6AC&__gda__=1430818556_7037059d7d6ada6c34a9683849ab2a46", device_token: nil, university_id: 1, status: 0},
  {facebook_id: "644172329045318", facebook_token: "CAAW9XnSoox4BAGJhD4ZCZACFxJC6yT0XDZAZCwSRRSJtwhgt8IC7AXNWzspEZBAQGv6O3G601sOXnqtYsYEni4M0MGb125HcvYT2m4QTZBDGWkdfgeMjxCmQlZCFI60VTagpg9HBj3svH84zKriYFqp2iZAAZC5MoWe4uTMzBNeQ0GTiAZC67mIRkDaTxZBWqdnI5CciircgkvjOdvqgRvrTCUEbqAZBlFRFdl8ZD", access_token: "aaaa", name: "Masanori Sotozaki", facebook_img: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xfa1/v/t1.0-1/s200x200/1237044_379885545473999_1850688442_n.jpg?oh=14e21e2ebac8b348a2e505518a7002f5&oe=55887102&__gda__=1434553529_e744ceee6a8c649491ed15b834a14ce9", device_token: "8f19d43234ea8a26027bd839769e5c7db66f16182b954c537f7c258530bfaf58", university_id: 1, status: 3},
  {facebook_id: "870286873035399", facebook_token: "CAAW9XnSoox4BAGYJqKOy18SsY9rDeG9M8KRaiK4RkyVThbPsJBQxnohiZBVx3koGlPlq6NZBsjQ6UyENeAvKDUMgkgPBaNj0FzWR6sU0yWpohAuRKGPx3ZApOjZAkF7946TxH4beXVMx1p460kpiRD7pNk9eOk3TMk1g93ggXZBZAfke5MtF6NsmdKS7emPECXRu1WtJATC821fz6bIWC5DTe1JRn9EEUllqIIjXpcf05nZCq1syrbL", access_token: "8a569861665904ca1dabdbdd493d0c5b", name: "Akira Saso", facebook_img: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xap1/v/t1.0-1/s200x200/224769_160920580638702_6577818_n.jpg?oh=30e5f7cd5919f85cfb2bee987c034acd&oe=558BFB96&__gda__=1431052706_27ae96f271a2bf4da6a578b55949bf43", device_token: "fcf0f89399cac8b786bb5111ec052f363e0297baa11dc3e345ea4ef974b0a04c", university_id: 1, status: 4},
  {facebook_id: "640706676059044", facebook_token: "CAAW9XnSoox4BANO37xUbvWtuZAd7MNgf111MgVAVrpGJhSya1jzcZBArOrfwiue156eB99SOctmim5f71s7f284geha0DcJVk2YYYvb65tQXZBEwuqgIcMzQVYGjZC6EbcVAlW2ioEow9P0kiYzNQhSNyGDZB60DtvCGBBwhm5sacoZAPKQoLybRJ2UPNzzvPLO1NgPRpZBGsiKZBRQuRcTvroZAXF4nRNcvRldF9PZBegtgZDZD", access_token: "0f90822c62a3632fab39196ca987710e", name: "Takeshi  Ihara", facebook_img: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpf1/v/t1.0-1/p200x200/10417552_614728208656891_1973806252622734131_n.jpg?oh=65c6662909d2068d7aafba96dd784028&oe=55805EDF&__gda__=1431758905_82f25cea8b928aaf851eb0287fbbb8e2", device_token: "", university_id: 1, status: 2}
])

arrange_time_user = User.find_by facebook_id: "10"
post_arrange_time_user = User.find_by facebook_id: "20"
post_matching_user = User.find_by facebook_id: "30"


UsersCoupon.create!([
  {user_id: 1, coupon_id: 1, status: 0},
  {user_id: arrange_time_user.id, coupon_id: 1, status: 0},
  {user_id: post_arrange_time_user.id, coupon_id: 1, status: 0},
  {user_id: post_matching_user.id, coupon_id: 1, status: 0},
])
