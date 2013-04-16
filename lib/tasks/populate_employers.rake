task :populate_employers => :environment do

  print "Populating Employers"

  yaml = File.read('data/hash_of_companies.yml')
  companies = YAML.load(yaml)
  
  student_size = Student.all.size

  companies.each_with_index do |company,index|
    if company
      employer = Employer.new
      employer.user_id = student_size + index + 1
      employer.name = company[:name]
      employer.industry = company[:industry] ? company[:industry] : "no industry found."
      employer.est_year = company[:founded] ? company[:founded] : "no founding date."
      employer.number_of_employees = company[:number_of_employees] ? company[:number_of_employees] : "no employment data"
      employer.funding = company[:funding] ? company[:funding] : "no funding info."

      if company[:hompage]
        index = company[:homepage].index(".")
        email = company[:name].downcase + "@" + company[:homepage][index+1..-1]
        email = email.gsub("/", "")
        employer.email = email
      else
        employer.email = company[:name].downcase + "@" + company[:name] + ".com"
      end

      employer.homepage_url = company[:homepage] ? company[:homepage] : "no homepage found."
      employer.description = String(company[:description]) ? company[:description] : "no description."
      if company[:logo]
        employer.logo = "http://www.crunchbase.com/" + company[:logo]["available_sizes"].first.last
      else
        "no image found"
      end

      print "."
      employer.save
    else
      next
    end
  end

  print "done.\n"
end