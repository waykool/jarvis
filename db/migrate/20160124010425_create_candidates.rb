class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :firstName
      t.string :lastName
      t.string :email

      t.timestamps null: false
    end
  end
end
