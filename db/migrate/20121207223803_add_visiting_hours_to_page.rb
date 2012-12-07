class AddVisitingHoursToPage < ActiveRecord::Migration
  def change
    add_column :pages, :visiting_hours, :string
  end
end
