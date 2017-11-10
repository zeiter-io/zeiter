namespace :generate do

  desc "Generate fake Users using Faker gem. Pass a count after the command."
  task fake_users: :environment do

    # What does this do?
    # @see method #3 in
    # http://cobwwweb.com/4-ways-to-pass-arguments-to-a-rake-task
    ARGV.each { |a| task a.to_sym do ; end }

    raise ArgumentError, "You forgot to mention the number of Users to create.
    Try 'rake generate:fakeusers 5'" unless ARGV[1]
    count = ARGV[1].to_i # Number of fake Users to generate

    password = 'password' # Dummy password that will get encrypted

    count.times do |n|
      fname = Faker::Name.first_name
      lname = Faker::Name.last_name
      user = User.create!(
              email: "#{fname}.#{lname}@localhost",
              password: password,
              password_confirmation: password,
              first_name: fname,
              last_name: lname,
              middle_name: n+1 # Skip 0
      )
      STDOUT.puts "Created User: #{user.first_name} #{user.middle_name} #{user.last_name}"
    end
  end # task fake_users

  desc "Generate fake Schedules from a pre-defined list."
  task fake_schedules: :environment do
    # Array of schedules (restaurants)
    schedules_arr = %w(IHOP Mom's Crush Hula's Starbucks)
    schedules_arr.each do |name|
      schedule = Schedule.create!(name: name)

      # Grab 20 unique users randomly
      users = User.limit(20).order("RANDOM()").uniq

      # Assign 12 users to the schedule as there are only
      # 12 shifts in the next task
      schedule.users << users[0..11]

      STDOUT.puts "Created Schedule: #{schedule.name} / Ucode: #{schedule.ucode}"
    end
  end # task fake_schedules

  desc "Generate fake Shifts from a pre-defined list and assign them to a random Schedule and User"
  task fake_shifts: :environment do
    # Array of shift names
    shifts_arr = %w(Dishwasher1 Dishwasher2 Cook1 Cook2 Cook3 Cashier1 Cashier2 Manager1 Manager2 Waiter1 Waiter2 Waiter3)

    Schedule.all.each do |sch|
      shifts_arr.each do |n|
        sch_users = sch.users # Get Users in the schedule

        # Create shift and assign to random user and schedule
        shift = Shift.create!(name: (shifts_arr.sample + "_#{sch.name}" ), user: sch_users.sample, schedule: sch)

        STDOUT.puts "Created Shift: #{shift.name} / Schedule: #{shift.schedule.name} / User: #{shift.user.full_name}"
      end
    end

  end # task fake_schedules

end # namespace :generate
