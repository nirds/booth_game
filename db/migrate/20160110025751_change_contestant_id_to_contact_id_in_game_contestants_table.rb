class ChangeContestantIdToContactIdInGameContestantsTable < ActiveRecord::Migration
  def change
    change_table :game_contestants do |t|
      t.remove :contestant_id
      t.belongs_to :contact, required: true, index: true
    end
  end
end
