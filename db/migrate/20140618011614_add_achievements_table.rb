class AddAchievementsTable < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :task, null: false
      t.integer :user_id

      t.timestamps
    end
  end
end
