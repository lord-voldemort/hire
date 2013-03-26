class CreateInterviewAppts < ActiveRecord::Migration
  def change
    create_table :interview_appts do |t|
      t.integer   :interview_id
      t.datetime  :date_time
      t.string    :type
      t.string    :location
      t.string    :interviewer
      t.text      :comments
      t.text      :follow_up
      t.timestamps
    end
  end
end
