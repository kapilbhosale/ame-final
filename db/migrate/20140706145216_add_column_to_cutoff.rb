class AddColumnToCutoff < ActiveRecord::Migration
  def up
  	execute "INSERT INTO cutoffs (id, college_id, college_name, branch_id, branch_name, university, cast, rank_closed, marks_closed, created_at, updated_at)
VALUES
	(1, 1002, 'Government College of Engineering  Amravati', 100219110, 'Civil Engineering', 'Shivaji University', 'GOPENO', 6029, 132, NULL, NULL),
	(3, 1002, 'Government College of Engineering  Amravati', 100219110, 'Civil Engineering', 'Shivaji University', 'GSTO', 20668, 99, NULL, NULL);
"
  end
end
