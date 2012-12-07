class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.string :title
      t.boolean :claimed
      t.references :page
      t.timestamps
    end
  end
end
