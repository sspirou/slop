class AddZipcodeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :zipcode, :string
  end
end
