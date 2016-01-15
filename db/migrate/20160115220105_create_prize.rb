class CreatePrize < ActiveRecord::Migration
  def change
    create_table :prizes do |t|
      t.string :image_url, required: true
      t.string :description, required: true

      t.belongs_to :game, required: true, index: true
    end
  end
end
