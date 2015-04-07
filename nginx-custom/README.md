# nginx-custom
Install and run nginx with custom modules.

To build:

```
docker build -t jeoygin/nginx-custom .
```

To run:

```
docker run -d --env-file=./env -p 80:80 nginx-custom
```

