# HTTP Response Tester
A simple ruby app for testing rest endpoint http responses. 

Currently hosted on heroku for public use (it is a free isntance, so overuse may disable it) here : https://zept-faker-endpoint.herokuapp.com/

## Endpoints
- (200)[https://zept-faker-endpoint.herokuapp.com/200]
- (404)[https://zept-faker-endpoint.herokuapp.com/404]
- (500)[https://zept-faker-endpoint.herokuapp.com/500]

## Querystring options
- `?delay={n}` 
    - causes the response to be delayed by `n` milliseconds to allow you to test loading spinners, etc
