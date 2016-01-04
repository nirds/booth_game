class Contestant < ActiveRecord::Base
  validates :email, uniqueness: {case_sensitive: false}, presence: true
  validates :twitter_handle, uniqueness: {case_sensitive: false}, presence: true
  validates :name, presence: true
end