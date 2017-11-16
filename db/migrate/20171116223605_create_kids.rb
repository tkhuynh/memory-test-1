class CreateKids < ActiveRecord::Migration[5.0]
  def change
    create_table :kids do |t|
      t.string :name
      t.string :email
      t.string :state

      t.timestamps
    end
  end
end
