# HTTP Response Tester
A simple ruby app for testing rest endpoint http responses. 

Currently hosted on heroku for public use (it is a free isntance, so overuse may disable it) here : https://http-endpoint-faker.herokuapp.com/

## CORS policy
The cors policy is purposely permissive so that you can get responses for PUT, POST, and DELETE calls.  

## Endpoints
- [200](https://http-endpoint-faker.herokuapp.com/200)
- [404](https://http-endpoint-faker.herokuapp.com/404)
- [500](https://http-endpoint-faker.herokuapp.com/500)

## Querystring options
- `?delay={n}` 
    - causes the response to be delayed by `n` milliseconds to allow you to test loading spinners, etc
