## Deal Redemptions

Ruby on Rails 4 engine to run redemptions for deal sites.

[![Gem Version](https://badge.fury.io/rb/deal_redemptions.svg)](http://badge.fury.io/rb/deal_redemptions)
[![Build Status](https://travis-ci.org/iamcutler/deal-redemptions.svg?branch=master)](https://travis-ci.org/iamcutler/deal-redemptions)

## Installation
```gem
gem install deal_redemptions
```

## Configuration
To generate a configure file to overwrite default settings in your hosted app. Please run the following rake task. The config file will be created as an initializer and have the optional settings commented out.

```rake
rake deal_redemptions:install:config
```

If you would like to disable the admin panel for any reason, it will be included as an optional setting in the initializer config file.

## Admin Interface
The design to the admin interface was inspired by the Shopify backend. Currently the admin panel is mainly simple CRUD interactions to manage redemptions, deal site companies, and products. Future releases will expand on the admin abilities to manage the gem, and generate reporting.

To generate an initial admin user, simple run
```rake
rake deal_redemptions:install:admin
```

## Dependencies
Tool                  | Description
--------------------- | -----------
[Twitter Bootstrap]   | Popular front-end framework for developing responsive, mobile first projects on the web.
[Kaminari]            | Elegant pagination for any sort of collection


[Twitter Bootstrap]: http://getbootstrap.com
[Kaminari]: https://github.com/amatsuda/kaminari
