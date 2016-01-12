require 'rails_helper'

RSpec.describe Contact, :type => :model do
  it 'requires a name' do
    hash = {  name: '',
              email: Faker::Internet.email,
              twitter_handle: Faker::Hacker.noun }
    contact = Contact.new(hash)
    expect(contact).to_not be_valid
  end

  it 'requires a email' do
    hash = {  name: Faker::Name.name,
              email: '',
              twitter_handle: Faker::Hacker.noun }
    contact = Contact.new(hash)
    expect(contact).to_not be_valid
  end

  it 'requires a unique email' do
    contact = create :contact
    hash = {  name: Faker::Name.name,
              email: contact.email,
              twitter_handle: Faker::Hacker.noun }
    new_contact = Contact.new(hash)
    expect(new_contact).to_not be_valid
  end

  it 'requires a twitter_handle' do
    hash = {  name: Faker::Name.name,
              email: Faker::Internet.email,
              twitter_handle: '' }
    contact = Contact.new(hash)
    expect(contact).to_not be_valid
  end

  it 'requires a unique twitter_handle' do
    contact = create :contact
    hash = {  name: Faker::Name.name,
              email: Faker::Internet.email,
              twitter_handle: contact.twitter_handle }
    new_contact = Contact.new(hash)
    expect(new_contact).to_not be_valid
  end
end