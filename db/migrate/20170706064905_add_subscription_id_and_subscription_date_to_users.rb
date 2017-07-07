class AddSubscriptionIdAndSubscriptionDateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :subscription_id, :integer
    add_column :users, :subscription_date, :datetime
  end
end
