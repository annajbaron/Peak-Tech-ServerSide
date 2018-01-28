# Peak-Tech-Server

* Commands used:
  - rails g model user first_name last_name email password_digest
  - rails db:create; rails db:migrate
  - rails g model organization name address overview:text employees:integer team_size:integer website twitter logo
  - rails g model techStack name  
  - rails g model tagging organization:references tech_stack:references

* Update Gemfile
* Update user model

  - rails g controller Api::V1::Tokens --no-assets --no-helper --skip-template-engine
  - rails g migration add_api_key_to_users
  - rails g controller Api::V1::Users --no-assets --no-helper --skip-template-engine
  - rails g serializer user first_name last_name email id created_at updated_at
  - rails g migration add_is_admin_to_users is_admin:boolean
  - rails g controller Api::V1::Users --no-assets --no-helper --skip-template-engine
  - rails g controller Api::V1::Admin::User --no-assets --no-helper --skip-template-engine

* Update api organization controller
  - rails g controller Api::V1::Organizations --no-assets --no-helper --skip-template-engine
  - rails g serializer organization name address overview:text employees:integer team_size:integer website twitter logo


* Add techStack api controller
  - rails g controller Api::V1::TechStacks --no-assets --no-helper --skip-template-engine
  - rails g serializer tech_stack name



This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
