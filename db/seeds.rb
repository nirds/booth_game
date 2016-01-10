# (1..100).each do |n|
#   c = Contestant.new
#   c.name = "Contestant #{n}"
#   c.email = "example#{n}@example.com"
#   c.twitter_handle = "tweeter#{n}"
#   c.save!

#   Ticket.create(contestant_id: c.id)
# end

Contact.create( email: "ex1@example.com", twitter_handle: "WAOK", name: "Sticks")
Contact.create( email: "ex2@example.com", twitter_handle: "JaeNikki_", name: "Kell")
Contact.create( email: "ex3@example.com", twitter_handle: "ChloeKerr_", name: "cheri")
Contact.create( email: "ex4@example.com", twitter_handle: "KweenBeaTrix", name: "NIRD")
Contact.create( email: "ex5@example.com", twitter_handle: "gulli01", name: "Utah")
Contact.create( email: "ex6@example.com", twitter_handle: "BygHoss", name: "Britt")
Contact.create( email: "ex7@example.com", twitter_handle: "jhelicious", name: "Britt")
Contact.create( email: "ex8@example.com", twitter_handle: "dress_fit", name: "Britt")
Contact.create( email: "ex9@example.com", twitter_handle: "dana0881", name: "Britt")
Contact.create( email: "ex0@example.com", twitter_handle: "shadowolflbc", name: "Britt")

Admin.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')