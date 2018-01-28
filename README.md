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

* Add meetUp model
   - rails g model meetUp name
* Add meetUp api controller
   - rails g controller Api::V1::MeetUps --no-assets --no-helper --skip-template-engine
   - rails g serializer meetUp name

* Geocoding - Organization
  - rails g migration add_geo_code_to_organizations longitude:float latitude:float

* Friendly Id - Organization
  - rails generate friendly_id
  - rails g migration add_slug_to_organizations slug

* Add SearchTerm model
   - rails g model SearchTerm title
* Add Story model
   - rails g model story title url search_term_id
   - rails generate migration add_story_id_to_stories story_id:integer

* Add stories api controller
   - rails g controller Api::V1::Stories --no-assets --no-helper --skip-template-engine

   - rails g serializer meetUp name


* Add stories_sync job
  - rails g job stories_sync

* Add story serializer
  - rails g serializer story title last_name url search_term_id

* Add search terms api controller
   - rails g controller Api::V1::SearchTerms --no-assets --no-helper --skip-template-engine


* Add search term  serializer
  - rails g serializer search_term title
