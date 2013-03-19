class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.integer :student_id
      t.integer :employer_id
      t.string :interview_date
      t.string :interview_location
      t.string :follow_up

      t.timestamps
    end
  end
end
