# leptos-test
Test leptos framework to assist w/ isaac's scouting app

# Run

Build image locally:
```
$ docker build -t test-this .
```

List images in your local docker application:
```
$ docker image ls
```

How to run the docker container locally:
```
$ docker run -p 3000:3000 leptos-test
$ docker run -p 127.0.0.1:3000:3000 leptos-test
```