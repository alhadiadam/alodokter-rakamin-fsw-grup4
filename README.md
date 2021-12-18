# API Development Hi!Dokter

This is the Hi!doctor API repository.
This API contains Create Users, Login, Update Profile, Reset Password.
and on the other hand it also contains. 
Create Article, List Article, Search Article, Show Detail Article and List Doctor, Search Doctor

This repository has also been deployed on heroku you can visit it at
> https://fsw-api-grup4.herokuapp.com/api/v1/

For the endpoint of each URL you can visit the Postman API Documentation Hi!Doctor at the following link
> https://www.postman.com/bold-meadow-219848/workspace/alodokter-api-documentation/collection/18514905-22e747d4-6935-4b2f-97a2-890f615ca076


## Getting Started

## Prerequisites
- you must have rbenv installed (http://rbenv.org/)
- you must have nodejs installed (https://github.com/creationix/nvm)
- you must have yarn installed (https://yarnpkg.com/lang/en/docs/install/#mac-stable)



## Setup
### Download/clone the repository:
> git clone https://github.com/alhadiadam/alodokter-rakamin-fsw-grup4.git

at API Development Section

### Install Gems
* `gem 'bcrypt', '~> 3.1.7'`
* `gem 'rack-cors'`
* `gem 'jwt'`
* `gem 'pg_search', '~> 2.3', '>= 2.3.5'`
* `gem 'sendinblue'`
* `gem 'kaminari'`
* `gem 'cloudinary'`
* `gem 'figaro'`
* `gem 'sib-api-v3-sdk'`
* `gem 'addressable'`

### Install the dependencies:
>`bundle install`

### Setup the database:

>`rails db:create rails db:migrate`


This project uses postgresql and gem as a database. Make sure you have postgresql set up and installed on your computer.

### To run the project:
>`rails s`

### To run the project locally:
> http://localhost:3000/(yourappname)/api/v1/:endpoint

## Acknowledgments
* Alodokter Team
* Rakamin Team
* Reza Nur Rochmat as a mentor
* ETC.
