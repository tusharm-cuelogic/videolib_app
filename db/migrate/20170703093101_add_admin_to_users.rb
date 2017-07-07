class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_type, :string, default: 'subscriber'
  end
end
