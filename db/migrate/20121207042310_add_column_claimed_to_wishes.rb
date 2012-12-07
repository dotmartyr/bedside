class AddColumnClaimedToWishes < ActiveRecord::Migration
  def change
    add_column :wishes, :claimed_by, :integer
  end
end
