# Vehicles API

![travis_status](https://travis-ci.org/podoglyph/vehicles_api.svg?branch=master)

A Rails JSON API for Vehicles, Makes, Models, and Options.

This app is built with:

* `Rails 5.1.5`
* `Ruby 2.4.1`
* `PostgreSQL 10.2`

To run:

1. Clone this repo and `cd vehicles_api`
3. `rails db:create`
4. `rails db:migrate`
5. `rails db:seed`
5.  Visit `localhost:3000` or use a HTTP client such as Postman to interact with the API using the docs below.

## API Documentation:

### Makes

| Resources | Detail |
| :-------- |:-------|
| GET `/api/v1/makes` | Index all makes |
| GET `/api/v1/makes/:id` | Show single make |
| POST `/api/v1/makes?make[name]=name&make[country]=country` | Create new make |
| PUT `/api/v1/makes/:id` | Update existing make |
| DELETE `/api/v1/makes/:id` | Delete existing make |


### Models

| Resources | Detail |
| :-------- |:-------|
| GET `/api/v1/makes/:id/models` | Index all models for a make |
| POST `/api/v1/makes/:id/models/?model[name]=<model_name>?model[year]=<model_year>?model[color]=<model_color>` | Create new model for a make |
| PUT `/api/v1/makes/:id/models/:id` | Update existing model |
| DELETE `/api/v1/makes/:id/models/:id` | Delete existing model |

### Options

| Resources | Detail |
| :-------- |:-------|
| GET `/api/v1/options` | Index all options |
| POST `/api/v1/options/?option[name]=name?option[cost]=<option_cost>` | Create a new option |
| PUT `/api/v1/options/:id/?option[name]=<option_name>` | Update existing option |
| DELETE `/api/v1/options/:id` | Delete existing option |

### Vehicles

| Resources | Detail |
| :-------- |:-------|
| GET `/api/v1/vehicles` | Index all vehicles |
| GET `/api/v1/vehicles/:id` | Show single vehicle |
| PUT `/api/v1/vehicles/:id?vehicle[name]=<vehicle_name>` | Update existing vehicle |
| DELETE `/api/v1/vehicles/:id` | Delete existing vehicle |

### Vehicle Custom Queries

| Resources | Detail |
| :-------- |:-------|
| GET /api/v1/vehicles/most_expensive | Index 3 most expensive vehicles |
| GET /api/v1/vehicles/least_mileage | Index 3 vehicles with lowest mileage |
| GET /api/v1/vehicles/option?option=<option_name> | Index vehicles with selected option |



## License

This project is licensed under the MIT License.
