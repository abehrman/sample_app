#By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                   "Michael Hartl"
  user.email                  "mhartl@example.com"
  user.password               "foobar"
  user.password_confirmation  "foobar"
end 

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :micropost do |micropost|
  micropost.content "Foo bar"
  micropost.association :user
end

Factory.define :auction do |auction|
  auction.user_id       1
  auction.subsidy       0
  auction.fees          0
  auction.end_time      "January 1, 2010 12:00:00 PM"
  auction.current_offer 100
  auction.current_offerer 1
  auction.title         "Junk"
  auction.description   "Random junk"
end