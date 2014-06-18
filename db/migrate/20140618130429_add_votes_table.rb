class AddVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :count
      t.integer :user_id
      t.integer :achievement_id

      t.timestamps
    end

  end
end
