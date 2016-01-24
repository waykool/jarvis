class AddIndexToCandidatesEmail < ActiveRecord::Migration
  def change
  	add_index :candidates, :email, unique: true
  end
end
