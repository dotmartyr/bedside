class AddPatientNameToPage < ActiveRecord::Migration
  def change
    add_column :pages, :patient_name, :string
  end
end
