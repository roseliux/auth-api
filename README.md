# README

## For run the app
```
docker-compose up
```


## For build the app
```
docker run -it -v $(pwd):/usr/src/app -w /usr/src/app ruby:2.2 bundle install && docker-compose build

```

## For debug with rubymine
GUIDE: http://bzzt.io/posts/running-the-rails-debugger-in-a-docker-container-using-rubymine
- IMPORTANT you need to configured inside rubymine the debugger after that you can run the commands.

To conect to the container the command is:
```
docker-compose run -p 1234:1234 -p 3000:3000 web bash
```

Inside to run the rdebug run:
```
rdebug-ide --host 0.0.0.0 --port 1234 --dispatcher-port 26162 -- bin/rails s -b 0.0.0.0 -p 3000 -e development
 ```

## For test
```
docker-compose run web rails test
```
