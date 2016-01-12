class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.belongs_to :game_contestant, required: true, index: true
      t.belongs_to :game, required: true, index: true

      t.timestamps null: false
    end
  end
end
