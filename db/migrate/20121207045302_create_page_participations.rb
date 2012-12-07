class CreatePageParticipations < ActiveRecord::Migration
  def change
    create_table :page_participations do |t|
      t.references :user
      t.references :page
      t.string :permission_level
      t.timestamps
    end
  end
end
