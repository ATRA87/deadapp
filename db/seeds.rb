# remote_pictures_urls = [
#   [],
#   [],
#   [
#     'https://www.trioangle.com/images/makent-banner.svg',
#     'https://www.youtube.com/embed/_pmOOsm5FL0?rel=0&amp;showinfo=0',
#     'https://www.trioangle.com/images/makent/airbnb_clone_Signup.png',
#     'https://www.trioangle.com/images/makent/technology.svg'
#   ],
#   [
#     'https://www.trioangle.com/images/makentcars-banner.svg',
#     'https://www.youtube.com/embed/O_7oQeeaYXI?rel=0&amp;showinfo=0',
#     'https://www.trioangle.com/images/makentcars/car_rental_Multi_login.png',
#     'https://www.trioangle.com/images/makentcars/technology.svg'
#   ],
#   [
#     'https://www.trioangle.com/images/makentboats-banner.svg',
#     'https://www.youtube.com/embed/9MlmOfwimUk?rel=0&amp;showinfo=0',
#     'https://www.trioangle.com/images/makentboats/boat_rental_Multiple_Login_SignUp-Boats.png',
#     'https://www.trioangle.com/images/makentboats/technology.svg'
#   ],
#   [
#     'https://www.trioangle.com/images/gofer-banner.svg',
#     'https://www.youtube.com/embed/TDdNh9RNxmg?rel=0&amp;showinfo=0',
#     'https://www.youtube.com/embed/6SroRpybKVc?rel=0&amp;showinfo=0',
#     'https://www.trioangle.com/images/gofer/uber_clone_Simple_SignUp_Login.png',
#     'https://www.trioangle.com/images/gofer/uber_clone_admin.png',
#     'https://www.trioangle.com/images/gofer/technology.svg'
#   ],
#   [
#     'https://www.trioangle.com/images/spiffy-banner.svg',
#     'https://www.youtube.com/embed/S3NLdxXpDKg?rel=0&amp;showinfo=0',
#     'https://www.trioangle.com/images/spiffy/fancy_clone__multiple_login_sign_up.pngs',
#     'https://www.trioangle.com/images/spiffy/fancy_clone_buyer.png',
#     'https://www.trioangle.com/images/spiffy/technology.svg'
#   ],
#   [
#     'https://www.trioangle.com/images/igniter-banner.svg',
#     'https://www.youtube.com/embed/whTJggEswLk?rel=0&amp;showinfo=0',
#     'https://www.trioangle.com/images/igniter/tinder_clone_Smooth_Search_Filters.png',
#     'https://www.trioangle.com/images/igniter/tinder_clone_AppStore.png',
#     'https://www.trioangle.com/images/igniter/technology.svg'
#   ],
#   [
#     'https://www.trioangle.com/images/eatreat-banner.svg',
#     'https://www.youtube.com/embed/hLtRUeNQqKE?rel=0&amp;showinfo=0',
#     'https://www.trioangle.com/images/eatreat/technology.svg'
#   ],
#   [
#     'https://www.trioangle.com/images/gofereats-banner.svg',
#     'https://www.youtube.com/embed/KL9KJnc-5Hk?rel=0&amp;showinfo=0',
#     'https://www.trioangle.com/images/gofereats/ubereats_clone_track_order.png',
#     'https://www.trioangle.com/images/gofereats/ubereats_clone_admin.png',
#     'https://www.trioangle.com/images/gofereats/technology.svg'
#   ],
#   [
#     'https://www.trioangle.com/images/passup-banner.svg',
#     'https://www.trioangle.com/images/passup/letgo_clone_easy_signup.png',
#     'https://www.trioangle.com/images/passup/technology.svg'
#   ]
# ]

if Rails.env.development?

  puts "---------------- Loading Fixtures --------------"

  `rails db:fixtures:load`

end

puts "---------------- Validating Customizations --------------"

Customization.find_each(&:validate!)

puts "---------------- Validating Features --------------"

Feature.find_each(&:validate!)

puts "---------------- Validating Orders --------------"

Order.find_each(&:validate!)

puts "---------------- Validating ProjectMembers --------------"

ProjectMember.find_each(&:validate!)

puts "---------------- Validating Users --------------"

User.find_each(&:validate!)

puts "---------------- Validating Reviews --------------"

Review.find_each(&:validate!)

puts "---------------- Validating Projects --------------"

Project.find_each(&:validate!)

puts "---------------- Validating ProjectAssets --------------"

ProjectAsset.find_each(&:validate!)

