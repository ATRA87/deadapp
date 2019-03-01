puts "---------------- Loading Fixtures --------------"

`rails db:fixtures:load`

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
