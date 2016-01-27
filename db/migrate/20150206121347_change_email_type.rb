class ChangeEmailType < ActiveRecord::Migration
  def change
  	change_column :employees, :email,  :string
  end
end
