# Sales Engine

## Introduction
Sales Engine is an API built application which utilizes RESTful routes to serve up endpoints to access various customer, merchant, invoice, items, and transaction details. 

Check out the Medium Blog post I wrote regarding the making of this application. https://medium.com/@billyhomeriii/rails-api-applications-1aa1fdc1f9f7

Built with:
```
Rails version             5.1.7
Ruby version              2.4.1-p111 (x86_64-darwin18)
RubyGems version          2.6.11
```

## Key Features
* Data Importing - Automated Rake Tasks for importing seed data
* Record Endpoints - Single record relationship endpoints
* Relationship Endpoints - Multi record relationship endpoints
* Business Intelligence Endpoints - Exposed BI endpoints
* RSPEC - Test suite
## Setup
```
* Clone or Fork project. 
* CD to directory.
* Run Bundle Install.
* Run Rails db:create, db:migrate
* Run Rake Imports for seed data
  * rake import_data:customers             
  * rake import_data:invoice_items         
  * rake import_data:invoices               
  * rake import_data:items                  
  * rake import_data:merchants              
  * rake import_data:transactions          
* Run bin/rails s #start the server 
```
## Overview

### **Record Endpoints**
#### Merchants
* `GET /api/v1/merchants`
```
returns all merchants resources
```
* `GET /api/v1/merchants/:id`
```
returns a single merchants resource
```
* `GET /api/v1/merchants/find?parameters`
```
find finders to return a single object representation
```
* `GET /api/v1/merchants/find_all?parameters`
```
find_all finders which should return all matches for the given query
```
* `GET /api/v1/merchants/random`
```
returns a random merchants resource
```

#### Customers
* `GET /api/v1/customers`
```
returns all customers resources
```
* `GET /api/v1/customers/:id`
```
returns a single customers resource
```
* `GET /api/v1/customers/find?parameters`
```
find finders to return a single object representation
```
* `GET /api/v1/customers/find_all?parameters`
```
find_all finders which should return all matches for the given query
```
* `GET /api/v1/customers/random`
```
returns a random customers resource
```

#### Invoice Items
* `GET /api/v1/invoice_items`
```
returns all invoice_items resources
```
* `GET /api/v1/invoice_items/:id`
```
returns a single invoice_items resource
```
* `GET /api/v1/invoice_items/find?parameters`
```
find finders to return a single object representation
```
* `GET /api/v1/invoice_items/find_all?parameters`
```
find_all finders which should return all matches for the given query
```
* `GET /api/v1/invoice_items/random`
```
returns a random invoice_items resource
```

#### Invocies
* `GET /api/v1/invoices`
```
returns all invoices resources
```
* `GET /api/v1/invoices/:id`
```
returns a single invoices resource
```
* `GET /api/v1/invoices/find?parameters`
```
find finders to return a single object representation
```
* `GET /api/v1/invoices/find_all?parameters`
```
find_all finders which should return all matches for the given query
```
* `GET /api/v1/invoices/random`
```
returns a random invoices resource
```

#### Items
* `GET /api/v1/items`
```
returns all items resources
```
* `GET /api/v1/items/:id`
```
returns a single items resource
```
* `GET /api/v1/items/find?parameters`
```
find finders to return a single object representation
```
* `GET /api/v1/items/find_all?parameters`
```
find_all finders which should return all matches for the given query
```
* `GET /api/v1/items/random`
```
returns a random items resource
```

#### Transactions
* `GET /api/v1/transactions`
```
returns all transactions resources
```
* `GET /api/v1/transactions/:id`
```
returns a single transactions resource
```
* `GET /api/v1/transactions/find?parameters`
```
find finders to return a single object representation
```
* `GET /api/v1/transactions/find_all?parameters`
```
find_all finders which should return all matches for the given query
```
* `GET /api/v1/transactions/random`
```
returns a random transactions resource
```

### **Relationship Endpoints**
#### Merchants
* `GET /api/v1/merchants/:id/items` 
```
returns a collection of items associated with that merchant
```
* `GET /api/v1/merchants/:id/invoices` 
```
returns a collection of invoices associated with that merchant from their known orders
```
#### Invoices
* `GET /api/v1/invoices/:id/transactions`
```
returns a collection of associated #### transactions
```
* `GET /api/v1/invoices/:id/invoice_items` 
```
returns a collection of associated invoice items
```
* `GET /api/v1/invoices/:id/items`
```
returns a collection of associated items
```
* `GET /api/v1/invoices/:id/customer`
```
returns the associated customer
```
* `GET /api/v1/invoices/:id/merchant` 
```
returns the associated merchant
```

#### Invoice Items
* `GET /api/v1/invoice_items/:id/invoice`
```
returns the associated invoice
```
* `GET /api/v1/invoice_items/:id/item`
```
returns the associated item
```

#### Items
* `GET /api/v1/items/:id/invoice_items`
```
returns a collection of associated invoice items
```
* `GET /api/v1/items/:id/merchant`
```
returns the associated merchant
```

#### Transactions
* `GET /api/v1/transactions/:id/invoice`
```
returns the associated invoice
```

### **Business Intelligence Endpoints**
#### All Merchants
* `GET /api/v1/merchants/most_revenue?quantity=x` 
```
returns the top x merchants ranked by total revenue
```
* `GET /api/v1/merchants/most_items?quantity=x`
```
returns the top x merchants ranked by total number of items sold
```
* `GET /api/v1/merchants/revenue?date=x`
```
returns the total revenue for date x across all merchants
```
*Dates provided match the format of YYYY-MM-DD*

#### Single Merchant
* `GET /api/v1/merchants/:id/revenue`
```
returns the total revenue for that merchant across successful transactions
```
* `GET /api/v1/merchants/:id/revenue?date=x`
```
returns the total revenue for that merchant for a specific invoice date x
```
* `GET /api/v1/merchants/:id/favorite_customer`
```
returns the customer who has conducted the most total number of successful transactions
```
* `GET /api/v1/merchants/:id/customers_with_pending_invoices`
```
returns a collection of customers which have pending (unpaid) invoices
```
*Dates provided match the format of YYYY-MM-DD*

#### Items
* `GET /api/v1/items/most_revenue?quantity=x`
```
returns the top x items ranked by total revenue generated
```
* `GET /api/v1/items/most_items?quantity=x`
```
returns the top x item instances ranked by total number sold
```
* `GET /api/v1/items/:id/best_day` 
```
returns the date with the most sales for the given item using the invoice date. If there are multiple days with equal number of sales, return the most recent day.
```
*Dates provided match the format of YYYY-MM-DD*

#### Customers
* `GET /api/v1/customers/:id/favorite_merchant`
```
returns a merchant where the customer has conducted the most successful transactions
```