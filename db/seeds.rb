PASSWORD = 'supersecret'


TechStack.destroy_all
Organization.destroy_all
User.destroy_all
MeetUp.destroy_all
Event.destroy_all
SearchTerm.destroy_all
Story.destroy_all

#-------------------------------------------------------- TECH-STACK
['Javascript', 'Ruby', 'Ruby on Rails', 'Node.js', 'React', 'jQuery', 'Bootstrap', 'Postgresql', 'MongoDB'].each do |tech_stack_name|
  TechStack.create(name: tech_stack_name)
end


tech_stacks = TechStack.all
puts Cowsay.say("Create #{tech_stacks.count} tech_stacks", :cow)

#
# #----------------------------------------------------- Organization
address = [
  "155-887 Great Northern Way, Vancouver, BC V5T 1E1",
  "301-788 Beatty St, Vancouver, BC V6B 2M1",
  "401-20540 Duncan Way, Langley, BC V3A 7A3",
  "100-2030 Marine Dr, North Vancouver, BC V7P 1V7",
  "373-13988 Cambie Rd, Richmond, BC V6V 2K4",
  "105-19110 24 Ave, Surrey, BC V3Z 3S9",
  "211 St. Patricks Ave, North Vancouver, BC V7L 3N3",
  "1687 Nanaimo St, Vancouver, BC V5L 4T9",
  "6-3490 Kingsway, Vancouver, BC V5R 5L7",
  "5307 Victoria Dr, Vancouver, BC V5P 3V6"
]

10.times do
  Organization.create(
    name: Faker::Company.name,
    address: address.sample,
    overview: Faker::HitchhikersGuideToTheGalaxy.quote,
    employees: rand(50..1000),
    team_size: rand(1..10),
    website: Faker::Internet.url,
    tech_stacks: [tech_stacks.sample]
  )
end

organizations = Organization.all
puts Cowsay.say("Create #{organizations.count} organizations", :ghostbusters)
#
# #-------------------------------------------------------- USER
super_user = User.create(
  first_name: 'Jon',
  last_name: 'Snow',
  email: 'js@gmail.com',
  password: PASSWORD,
  is_admin: true
)

20.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
    password: PASSWORD,
    organization: organizations.sample
  )
end

users = User.all
puts Cowsay.say("Create #{users.count} users", :tux)
#
# #----------------------------------------------------- Meet-Up
id = [
  'YVR-Startups',
  'Vancouver-PHP',
  'vancouver-ruby',
  'BrainStation-Vancouver',
  'VancouverTechMeetup',
  'Vancouver-Hack-Space',
  'TechVancouverOrg',
  'Vancouver-Postgres-Database',
  'The-Vancouver-UX-Research-Lab',
  'codecoffeeyvr'
]
id.each do |id_name|
  MeetUp.create(name: id_name)
end

# 10.times do
#   MeetUp.create name: id.sample
# end
meet_ups = MeetUp.all
puts Cowsay.say("Create #{meet_ups.count} meet_ups", :cow)
#
# #----------------------------------------------------- Event

EventSyncJob.new.perform
# e_number = 1
# 30.times do
#   Event.create(
#     name: Faker::Dog.name,
#     date: Faker::Date.forward(23),
#     url: Faker::Internet.url,
#     meet_up: MeetUp.all.sample,
#     event_id: e_number += 1)
# end
events = Event.all
puts Cowsay.say("Create #{events.count} events", :cow)


#
# #----------------------------------------------------- search_terms
searchterms = [
  'Vancouver-Tech',
  'Vancouver-PHP',
  'vancouver-ruby',
  'BrainStation-Vancouver',
  'VancouverTechMeetup',
  'Vancouver-Hack-Space',
  'TechVancouverOrg',
  'Vancouver-Postgres-Database',
  'The-Vancouver-UX-Research-Lab',
  'codecoffeeyvr'
]

searchterms.each do |term|
  SearchTerm.create(title: term)
end
# 20.times do
#   SearchTerm.create title: Faker::Coffee.blend_name
# end
search_terms = SearchTerm.all
puts Cowsay.say("Create #{search_terms.count} search_terms", :tux)
#
# #----------------------------------------------------- stories

StorySyncJob.new.perform
# s_number = 1
# 50.times do
#   Story.create(
#     title:Faker::Cat.name,
#     date: Faker::Date.forward(60),
#     url: Faker::Internet.url('news.com'),
#     search_term: SearchTerm.all.sample,
#     story_id: s_number += 1)
# end

stories = Story.all
puts Cowsay.say("Create #{stories.count} stories", :tux)

# #-------------------------------------------------------------------
puts "Login as admin with #{super_user.email} and password of '#{PASSWORD}'!"
