class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :firstname
      t.string :midname
      t.string :lastname
      t.string :pesel
      t.string :address
      t.string :city
      t.string :state
      t.string :postal
      t.string :country
      t.string :phone
      t.string :gender
      t.string :department
      t.date :birthdate
      t.date :hiredate
      t.date :email
      t.integer :hrsperweek
      t.decimal :wage
      t.string :nationality
      t.string :marital

      t.timestamps null: false
    end
  end
end
