class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :body
      t.references :user
      t.references :page
      t.timestamps
    end
  end
end
