# Welcome to Cinema App

## Technologies

* Rails 6, Postgres.
* RSpec for tests. Run ```rspec``` before pushing to repository to avoid test failures.
* Rubocop for code style. Run ```rubocop``` before pushing to repository to avoid offenses.

## Installation

Imanging you are running MacOS or Linux:
* Install postgres
* Install ruby-3.0.1
* Use your ruby environment manager of choice (.rvm, .rb_env, etc) to create and then run a "cinema_app" environment under ruby-3.0.1
* Install rails (```gem install rails -v 6.1.4```)
* run ```bundle``` to install necessary gems
* Create the database files (```rails db:create```)
* Setup Credentials (See below)
* Run any pending database migrations (```rails db:migrate```)
* Seed for Admin data (```rails db:seed```)
* Start server with cmd `rails s`. Test the app is running OK by going to `http://localhost:3000/`

## Useful Endpoints

1. Visit ```localhost:3000/admin``` and populate db with movies records. You can find admin example in seed file.
2. Visit ```localhost:3000/api-docs``` for testing API endpoints.

## Setup Credentials

For creating or editing environment credentials use this command: `EDITOR=nano|vim rails credentials:edit`. It provides utility to easily create and use environment specific credentials. It has own encryption key `master.key` which is in .gitignore. Make sure `master.key` file into `config/`. 
