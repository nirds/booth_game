class AddCampaignToGame < ActiveRecord::Migration
  def change
    add_column :games, :campaign, :integer, required: true
  end
end
