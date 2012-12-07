class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :hospital
      t.string :room
      t.text :tips
      t.text :overview
      t.timestamps
    end
  end
end
