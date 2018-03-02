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


## License

This project is licensed under the MIT License.
