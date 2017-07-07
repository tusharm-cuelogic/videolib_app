class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :plan_code
      t.integer :no_of_videos
      t.integer :expiry_in_days
      t.integer :cost
      t.boolean :is_active, default: true, null: false

      t.timestamps null: false
    end
  end
end
