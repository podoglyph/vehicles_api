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
| POST `/api/v1/makes?make[name]=name` | Create new make |
| PUT `/api/v1/makes/:id` | Update existing make |
| DELETE `/api/v1/makes/:id` | Delete existing make |


### Models

| Resources | Detail |
| :-------- |:-------|
| GET `/api/v1/makes/:id/models` | Index all models for a make |
| POST `/api/v1/makes/:id/models/?model[name]=name` | Create new model for a make |
| PUT `/api/v1/makes/:id/models/:id` | Update existing model |
| DELETE `/api/v1/makes/:id/models/:id` | Delete existing model |

## License

This project is licensed under the MIT License.
