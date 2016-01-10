class AddEndedAtToGame < ActiveRecord::Migration
  def change
    add_column :games, :ended_at, :date
  end
end
