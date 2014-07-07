class CreateCollegeUniversities < ActiveRecord::Migration
  def change
    create_table :college_universities do |t|
      t.integer :college_id, :null => false
      t.string 	:university, :null => false	
      t.timestamps
    end
  end
end
