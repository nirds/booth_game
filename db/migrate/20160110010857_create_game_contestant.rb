class CreateGameContestant < ActiveRecord::Migration
  def change
    create_table :game_contestants do |t|
      t.belongs_to :contestant, required: true, index: true
      t.belongs_to :game, required: true, index: true

      t.boolean :is_drawing_winner, default: false
      t.integer :retweet_count, default: 0
    end
  end
end
