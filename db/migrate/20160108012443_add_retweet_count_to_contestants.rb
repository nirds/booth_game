class AddRetweetCountToContestants < ActiveRecord::Migration
  def change
    add_column :contestants, :retweet_count, :integer, default: 0
  end
end
