class CreateCutoffs < ActiveRecord::Migration
  def self.up
      create_table :cutoffs do |t|
      	t.integer 	:college_id, :null => false
      	t.string 	:college_name, :null => false
      	t.integer	:branch_id, :null => false
      	t.string	:branch_name, :null => false
        t.string  :university, :null => false
      	t.string	:cast, :null => false
      	t.integer	:rank_closed, :null => false, :default => 0
      	t.float		:marks_closed, :null => false, :default => 0

        t.timestamps
      end
      # add_index :branch_id, :college_id, :unique=>true, :name => "UNIQUE"
  end

  def self.down
      drop_table :cutoffs
  end
end
