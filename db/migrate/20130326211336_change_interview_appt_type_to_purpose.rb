class ChangeInterviewApptTypeToPurpose < ActiveRecord::Migration
  def change
    rename_column :interview_appts, :type, :purpose
  end

end
