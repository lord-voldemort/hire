task :populate_students => :environment do

  Student.find_each do |student|
    user = User.new
    user.email = student.email
    user.password = "flatiron"
    user.save
  end

end