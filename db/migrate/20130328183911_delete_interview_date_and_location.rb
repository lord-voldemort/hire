class DeleteInterviewDateAndLocation < ActiveRecord::Migration
  def change
    remove_column :interviews, :interview_date
    remove_column :interviews, :interview_location
  end
end
