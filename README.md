# TogetherJS - Demo

[TogetherJS](https://github.com/jsfiddle/togetherjs) is a service for your website that makes it surprisingly easy to collaborate in real-time.

This project aims to achieve the following:

1. Build TogetherJS server docker image
1. Build TogetherJS client site for demo (in docker image)
1. Docker compose to start the demo in local environment

## How to use

### Server

Server listening to `HOST` and port 8080.

#### Environment variable

`HOST`: the server host listening to

#### Example

```
$ docker run --rm --name temp-server -p 8080:8080 -e HOST="0.0.0.0" iuhhdev/togetherjs-server
```

## Useful Commands

*This project is developed by ubuntu environment with docker*