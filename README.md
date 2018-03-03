# Vehicles API

![travis_status](https://travis-ci.org/podoglyph/vehicles_api.svg?branch=master)

A Rails JSON API for Vehicles, Makes, Models, and Options.

This app is built with:

* `Rails 5.1.5`
* `Ruby 2.4.1`
* `PostgreSQL 10.2`

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
| POST `/api/v1/makes/:id/models/?model[name]=name?model[year]=year?model[color]=color` | Create new model for a make |
| PUT `/api/v1/makes/:id/models/:id` | Update existing model |
| DELETE `/api/v1/makes/:id/models/:id` | Delete existing model |

### Options

| Resources | Detail |
| :-------- |:-------|
| GET `/api/v1/options` | Index all options |
| POST `/api/v1/options/?option[name]=name?option[cost]=cost` | Create a new option |
| PUT `/api/v1/options/:id/?option[name]=name` | Update existing option |
| DELETE `/api/v1/options/:id` | Delete existing option |

### Vehicles

| Resources | Detail |
| :-------- |:-------|
| GET `/api/v1/vehicles` | Index all options |
| DELETE `/api/v1/vehicles/:id` | Delete existing option |

## License

This project is licensed under the MIT License.
