# README

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

<img width="1365" height="650" alt="contact_list" src="https://github.com/user-attachments/assets/2342eb28-4daa-4c9c-a866-ecc0b6d40cdd" />

<img width="1366" height="650" alt="contatc2" src="https://github.com/user-attachments/assets/fb560072-aad8-43c8-a320-7f7154bbc9c8" />


## inicio

```
rails new contact_list -d postgresql

rails db:create
```


## se o servidor travar
```
rm tmp/pids/server.pid
bin/rails restart
```


# model 
```
bin/rails generate model Contact \
  name:string \
  phone:string \
  email:string \
  company:string \
  position:string \
  birthdate:date \
  notes:text \
  avatar:string

bin/rails db:migrate

bin/rails generate controller Contacts index show new edit

rails routes  

bin/rails generate model User \
  name:string \
  email:string \
  password_digest:string

bin/rails db:migrate

gem "bcrypt", "~> 3.1.7"

bundle install
```
