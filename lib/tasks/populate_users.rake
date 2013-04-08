task :populate_students => :environment do

  Student.find_each do |student|
    user = User.new
    user.email = student.email
    user.password = "flatiron"
    user.save
 end
end
    

task :populate_employers => :environment do
    Employer.find_each do |employer|
      user = User.new
      user.email = employer.email
      user.password = "flatiron"
      user.save
  end

end