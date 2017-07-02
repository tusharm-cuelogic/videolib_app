class AddFirstNameAndLastNameAndUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :address, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :city, :string
    add_column :users, :country, :string
  end
end
