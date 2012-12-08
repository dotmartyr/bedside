class AddDefaultValuePagePermissionLevel < ActiveRecord::Migration
  def up
    change_column :page_participations, :permission_level, :string, :default => "follower"
  end

  def down
    change_column :page_participations, :permission_level, :string, :default => nil
  end
end
