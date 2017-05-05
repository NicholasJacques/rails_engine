# README

# Rails Engine

## Introduction:

This is a paired-project on learning how to build an API. The data used is SalesEngine data. ActiveRecord queries, RSpec testing, Postgres database, using a Rails application. Format: JSON API endpoints. 

Rails Engine Project Spec Requirements: [here](http://backend.turing.io/module3/projects/rails_engine)

### Collaborators

-Maria Stenquist & Nick Jacques
Link to Project Repo:  [github](https://github.com/NicholasJacques/rails_engine)


## Get Started with Rails Engine:

Clone this repo in your terminal/shell:
```
git clone https://github.com/NicholasJacques/rails_engine.git
```

Navigate into the project by running the commands:
```
ls (see the name of project directory
cd rails_engine (navigates into the project)
```

Install required gems:
```
bundle 
```

Create, migrate, and seed the database:
```
rake db:setup

rake seed:seed_all

```

Testing: Run the command `rspec` in the terminal/shell                                                                          
If you would like to run this project against the Turing Rails Engine Spec Harness visit:  

https://github.com/turingschool/rales_engine_spec_harness 

And follow the instructions. The truncated instructions to quickly get it up and running:
```
git clone https://github.com/turingschool/rales_engine_spec_harness.git
cd rales_engine_spec_harness
bundle
rake test
 
```

## Endpoints
You can visit these endpoints to see a JSON response.

In your terminal, start a local server by running the command: `rails server`

In a browser address bar navigate to: `localhost:3000`

### Record Endpoints

#### Merchants

Once localhost:3000 is running in the browse, you can navigate to the record endpoints by appending the routes below.
For example, for the first route below, navigate to localhost:3000/api/v1/merchants to view. You will see JSON output, and in order to view this in a more readable format: you can install a JSON Formatter (browser plugin) to have the JSON output printed in a more readable format. 

- **<code>GET</code> /api/v1/merchants**
- **<code>GET</code> /api/v1/merchants/:id**
- **<code>GET</code> /api/v1/merchants/random**

#### Customers
- **<code>GET</code> /api/v1/customers**
- **<code>GET</code> /api/v1/customers/:id**
- **<code>GET</code> /api/v1/customers/random**

#### Items
- **<code>GET</code> /api/v1/items**
- **<code>GET</code> /api/v1/items/:id**
- **<code>GET</code> /api/v1/items/random**

#### Invoices
- **<code>GET</code> /api/v1/invoices**
- **<code>GET</code> /api/v1/invoices/:id**
- **<code>GET</code> /api/v1/invoices/random**

#### Invoice_Items
- **<code>GET</code> /api/v1/invoice_items**
- **<code>GET</code> /api/v1/invoice_items/:id**
- **<code>GET</code> /api/v1/invoice_items/random**

#### Transactions
- **<code>GET</code> /api/v1/transactions**
- **<code>GET</code> /api/v1/transactions/:id**
- **<code>GET</code> /api/v1/transactions/random**

### Relationship Endpoints

#### Merchants

- **<code>GET</code> /api/v1/merchants/:id/items** returns a collection of items associated with that merchant
- **<code>GET</code> /api/v1/merchants/:id/invoices** returns a collection of invoices associated with that merchant from their known orders

#### Invoices

- **<code>GET</code> /api/v1/invoices/:id/transactions** returns a collection of associated transactions
- **<code>GET</code> /api/v1/invoices/:id/invoice_items** returns a collection of associated invoice items
- **<code>GET</code> /api/v1/invoices/:id/items** returns a collection of associated items
- **<code>GET</code> /api/v1/invoices/:id/customer** returns the associated customer
- **<code>GET</code> /api/v1/invoices/:id/merchant** returns the associated merchant

#### Invoice Items

- **<code>GET</code> /api/v1/invoice_items/:id/invoice** returns the associated invoice
- **<code>GET</code> /api/v1/invoice_items/:id/item** returns the associated item

#### Items

- **<code>GET</code> /api/v1/items/:id/invoice_items** returns a collection of associated invoice items
- **<code>GET</code> /api/v1/items/:id/merchant** returns the associated merchant
#### Transactions

- **<code>GET</code> /api/v1/transactions/:id/invoice** returns the associated invoice

#### Customers

- **<code>GET</code> /api/v1/customers/:id/invoices** returns a collection of associated invoices
- **<code>GET</code> /api/v1/customers/:id/transactions** returns a collection of associated transactions

### Business Intelligence Endpoints

#### Merchants

- **<code>GET</code> /api/v1/merchants/most_revenue?quantity=x** returns the top x merchants ranked by total revenue
- **<code>GET</code> /api/v1/merchants/most_items?quantity=x** returns the top x merchants ranked by total number of items sold
- **<code>GET</code> /api/v1/merchants/revenue?date=x** returns the total revenue for date x across all merchants
- **<code>GET</code>  /api/v1/merchants/:id/revenue** returns the total revenue for that merchant across all transactions
- **<code>GET</code>  /api/v1/merchants/:id/revenue?date=x** returns the total revenue for that merchant for a specific invoice date x
- **<code>GET</code>  /api/v1/merchants/:id/favorite_customer** returns the customer who has conducted the most total number of successful transactions.

#### Items

- **<code>GET</code> /api/v1/items/most_items?quantity=x** returns the top x item instances ranked by total number sold

#### Customers

- **<code>GET</code> /api/v1/customers/:id/favorite_merchant** returns a merchant where the customer has conducted the most successful transactions


