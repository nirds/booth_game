class RenameContestantsTableToContactsTable < ActiveRecord::Migration
  def change
    rename_table :contestants, :contacts
  end
end
