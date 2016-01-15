class AddPhoneToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :phone, :string, required: true
  end
end
