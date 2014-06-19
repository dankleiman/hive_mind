class RenameCountToWeighting < ActiveRecord::Migration
  def change
    rename_column :votes, :count, :weighting
  end
end
