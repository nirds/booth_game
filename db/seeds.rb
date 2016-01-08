(1..100).each do |n|
  c = Contestant.new
  c.name = "Contestant #{n}"
  c.email = "example#{n}@example.com"
  c.twitter_handle = "tweeter#{n}"
  c.save!

  Ticket.create(contestant_id: c.id)
end


Admin.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')