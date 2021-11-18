namespace :applications do
  desc 'Generate applications for a scholarship'
  task generate: :environment do
    scholarship = Scholarship.create!(name: 'Example Scholarship', published: true, application_deadline: 1.month.from_now)
    3.times do |i|
      scholarship.questions << Question.new(prompt: "How would you describe your answer to example question #{i + 1}", word_limit: 200)
    end
    first_names = ['Alexa', 'Bethany', 'Candace', 'Desiree', 'Erika', 'Francesca', 'Gina', 'Henna', 'Isabella', 'Jacqueline']
    last_names = ['Adams', 'Bonta', 'Chen', 'Delgato', 'Evender', 'Ford', 'Giambroni', 'Henry', 'Ideker', 'Johnson']
    names = first_names.product(last_names)
    names.shuffle.take(40).each_with_index do |name, i|
      applicant = User.create!(first_name: name[0], last_name: name[1], email: "example_#{i}@example.com", password: 'password', password_confirmation: 'password')
      application = Application.create!(scholarship: scholarship, applicant: applicant,
        submitted: true,
        name: applicant.to_s,
        dob: "1/1/2000",
        email: applicant.email,
        address: "1 Example Street\nBend, OR\n97702",
        phone_number: "541-555-5555",
        ages_of_children: "1, 2, 3",
        marital_status: "Married",
        student_id: "123456789",
        ssn: "5555",
        institution_name: 'Example University',
        academic_year: '2020-21',
        institution_address: "100 Example Street\nBend, OR\n97703",
        major: 'Computer Science',
        completion_date: "6/6/2025",
        academic_standing: "Freshman",
        high_school_gpa: 4.0,
        career_plan: 'A career in sustainable aerospace engineering.',
        high_school_name: 'Example High School',
        high_school_graduation_year: '2020',
        total_monthly_income: 100,
        total_scholarship_monthly: 100,
        tuition_cost: 100,
        supplies: 100,
        childcare: 100,
        transportation: 100,
        other: 100,
        monthly_expenses: 100,
        savings: 100,
        investments: 100,
        school_loan_debt: 100,
        other_debt: 100
      )
      scholarship.questions.each do |question|
        application.answers << Answer.new(question: question, body: 'Example answer to question. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.')
      end
      application.awards << Award.new(name: 'Example Award 1', description: 'A description of the award.', date: 2.years.ago)
      application.awards << Award.new(name: 'Example Award 2', description: 'A description of the award.', date: 1.year.ago)
      application.experiences << Experience.new(kind: :employment, title: 'Example Job', started_at: 1.year.ago, frequency: '3 shifts/wk', responsibilities_accomplishments_honors: 'Example job description', total_hours: 200)
      application.experiences << Experience.new(kind: :volunteer_experience, title: 'Example Volunteer', started_at: 2.years.ago, frequency: 'once a month', responsibilities_accomplishments_honors: 'Example volunteer accomplishments description', total_hours: 40)
      application.experiences << Experience.new(kind: :school_activity, title: 'Example School Activity', started_at: 2.months.ago, frequency: 'bi-weekly', responsibilities_accomplishments_honors: 'Example school activity accomplishment', total_hours: 20)
      application.external_scholarships << ExternalScholarship.new(name: 'Example grant 1', amount: 200)
      application.external_scholarships << ExternalScholarship.new(name: 'Example grant 2', amount: 500)

      recommendation_letter = File.open('lib/assets/example_recommendation_letter.pdf')
      application.recommendation_letter.attach(io: recommendation_letter, filename: 'example_recommendation_letter.pdf', content_type: 'application/pdf')

      [1, 2, 3].map { |n| File.open("lib/assets/example_transcript_0#{n}.pdf") }.each do |transcript|
        application.transcripts.attach(io: transcript, filename: 'transcript.pdf', content_type: 'application/pdf')
      end
    end
  end

  desc 'Delete all applications'
  task clear: :environment do
    Application.all.each do |application|
      application.recommendation_letter.purge
      application.transcripts.each do |transcript|
        transcript.purge
      end
      application.destroy!
    end
    User.applicant.destroy_all
    Scholarship.find_by_name('Example Scholarship').destroy!
  end

end
