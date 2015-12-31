class Contestant < ActiveRecord::Base
  validates :email, uniqueness: {case_sensitive: false}
  validates :twitter_handle, uniqueness: {case_sensitive: false}
  validates :name, presence: true
end