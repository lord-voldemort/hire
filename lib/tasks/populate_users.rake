task :populate_user_students => :environment do

  print "populating user for students"

  Student.find_each do |student|
    user = User.new
    user.email = student.email
    user.role = "Student"
    user.password = "flatiron"
    user.save
    print "."
 end
 print "done.\n"
end
    

task :populate_user_employers => :environment do

  print "populating user for employers"

    Employer.find_each do |employer|
      user = User.new
      user.email = employer.email
      user.role = "Employer"
      user.password = "flatiron"
      user.save

      print "."
  end
  print "done.\n"
end

