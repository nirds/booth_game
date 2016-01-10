class CreateGame < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :twitter_handle, required: true
      t.string :hash_tag, required: true

      t.timestamps null: false
    end
  end
end
