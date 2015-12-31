(1..100).each do |n|
  c = Contestant.new
  c.name = "Contestant #{n}"
  c.email = "example#{n}@example.com"
  c.twitter_handle = "tweeter#{n}"
  c.save!
end