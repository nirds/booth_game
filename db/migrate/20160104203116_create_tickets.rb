class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :contestant_id, required: true

      t.timestamps null: false
    end
  end
end
