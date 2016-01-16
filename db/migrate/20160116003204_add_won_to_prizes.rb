class AddWonToPrizes < ActiveRecord::Migration
  def change
    add_column :prizes, :won, :boolean, default: false
  end
end
