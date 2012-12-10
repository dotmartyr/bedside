class AddAvatarUtlToPages < ActiveRecord::Migration
  def change
    add_column :pages, :avatar_url, :string
  end
end
