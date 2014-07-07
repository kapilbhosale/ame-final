class AddColumnToCutoff < ActiveRecord::Migration
  def up
  	add_column :cutoffs, :university, :string, :after => :branch_name
  end
end
