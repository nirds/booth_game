class CreateContestant < ActiveRecord::Migration
  def change
    create_table :contestants do |t|
      t.string :email, required: true
      t.string :twitter_handle, required: true
      t.string :name, required: true

      t.timestamps null: false
    end
  end
end
