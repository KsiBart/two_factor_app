class AddActiveSmsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :active_sms, :boolean, default: true
  end
end
