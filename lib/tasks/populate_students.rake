task :populate_students => :environment do

  print "Populating students"

  students = ["Ana Becker",
 "Laura Brown",
 "Andrew Callahan",
 "Christina Chang",
 "Crystal Chang",
 "Tyler Davis",
 "John Kelly Ferguson",
 "Victoria Friedman",
 "Daniel Gantz",
 "Alex Gorski",
 "Ei-lene Heng",
 "Tim Hunter",
 "Eric Iacutone",
 "Yanik Jayaram",
 "Justin Kestler",
 "Cho Kim",
 "Jesse Larusso",
 "Erin Lee",
 "Dave Liu",
 "Danny Olinsky",
 "Masha Rikhter",
 "Rahul Seshan",
 "Wallis Tsai",
 "Jane Vora",
 "Eugene Wang",
 "Harrison Wang",
 "Anthony Wijnen"]

 industries = ["gaming", "fashion", "media", "communcation", "education", "finance", "healthcare", "nonprofit"]

   students.each_with_index do |student,index|
    s = Student.new
    s.name = student
    s.preferred_industry = industries.sample.capitalize
    s.preferred_location = "NYC"
    s.user_id = index + 1

    names = student.split
    email = names.first.downcase + "." + names.last.downcase + "@flatironschool.com"
    s.email = email

    print "."

    s.save
  end

  print "done.\n"

end