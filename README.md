# Readme Marketplace Back-End

Marketplace Back-End is an SaaS (Software as a Service) Application to help many sellers to sell their products online.

Thank you for purchasing this product, We really appreciate for your choice to choose us by using this application to help your business grow. This app was build with passion and loved of simplicity to Ruby on Rails Framework. Don't forget to checkout our other products [toninee](https://toninee.com)

## How to run rake tasks

`bundle exec rake wallet:generate`

## Framework

- Ruby 3.1.2
- Rails 7.0.6
- Bootstrap 5
- Tom Select
- Stimulus Js
- Hotwire

## Features

### General

- Payment gateway xendit
- Pagy pagination
- Optimized gemfile and query
- Fast applications
- Contact us
- Subscribe to newsletter

### User

- Sign In / Sign Up
- Update profile, bank, and address
- Add to cart
- Add to wishlist
- Make a purchase order
- E-Wallet payment product, withdrawal and top-up
- Reviews
- Apply promotion
- Tax

### Merchant

- Sign In / Sign Up
- Campaigns
- Update profile
- E-Wallet payment campaign, withdrawal and top-up
- Create product
- Receive orders / Process orders

### How to run docker?

1. Build and run containers

```
docker-compose build
docker-compose up

```

2. Create database

```
docker-compose run web rake db:create
docker-compose run web rails g model User name:string
```
