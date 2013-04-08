task :populate_user_students => :environment do

  Student.find_each do |student|
    user = User.new
    user.email = student.email
    user.role = "Student"
    user.password = "flatiron"
    user.save
 end
end
    

task :populate_user_employers => :environment do
    Employer.find_each do |employer|
      user = User.new
      user.email = employer.email
      user.role = "Employer"
      user.password = "flatiron"
      user.save
  end

end