partners = ["Thibault", "Dima", "Clémence", "Arthur"]

user1 = partners.sample
partners.delete(user1)
user2 = partners.sample
partners.delete(user2)
pair1 = "#{user1} and #{user2}"
pair2 = "#{partners[0]} and #{partners[1]}"
puts "#{pair1} will be working together today"
puts "#{pair2} will be working together today"


