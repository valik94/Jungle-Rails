# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe


## Notes
MVC - Design or Architectural Pattern (used by rails) to make complex web applications
Model talks to  => DB => through ActiveRecord (rails most popular library)
View            => EJS Templates (in Node) => Ruby renders HTML (alternatives are slim)
Controller      => Project Manager - responsible for making sure request is complete. Deals with user by fulfilling the request. 

ERB templates - Embedded Ruby --> like EJS templates in Embedded Javascript

ERB templates in views -> products folder -> .erb files mostly HTML with embedded ruby (i.e. @products.image, @product.name...)
 
Look at rails server to see where templates are rendered.

## Implementing the following feature:
## Storewide Sales
Ability for admins to create sales which would mark everything in the sotre x% off, for a certain amount of time.
They should be able to create sales date ranges.

Examples:
- Everything is 10% off for back-2-school (Aug 10 -> Sep 4)
- Everthing is off 30% for Christmas Holidays (Dec 15 -> Jan 3)

EDD - Error Driven Development

### Technical Specifications:
-ability for admins to create Sale records
-name
-percent_off
-starts_on (date)
-ends_on (date)

2- Once any sale is active, display it on the products#index page (home page) or any page and affect the prices

EDD