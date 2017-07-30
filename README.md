# README

IC liquid harmonic challenge

* Ruby version
2.4.0

* Configuration
REDIS running on standard 6379 port for sidekiq

* Database creation
Follow postgres setup https://gorails.com/setup/osx/10.11-el-capitan

* Database initialization
Change database.yml database names to match current OSX username
rails db:create
rails db:migrate

* How to run the test suite
rspec spec/
Note the test suite is incomplete

* Services (job queues, cache servers, search engines, etc.)
*sidekiq (background event scheduler) *
bundle exec sidekiq

* How to run
rails s
visit localhost:3000

