# chrome-remote-cdp

## How to build the image:

```
docker build -t diemol/chrome-remote-cdp .
```

## How to run the container:

```
docker run --name=chrome -it --rm -p 4444:4444 -p 9222:9222 -p 5900:5900 -v /dev/shm:/dev/shm diemol/chrome-remote-cdp:latest
```

## Additional notes:

* The container has VNC installed, so you can use any VNC Client and connect to see what happens inside. VNC password: secret
* This work in progress, currently nginx is used to route things internally, perhaps there is a more simple and straightforward way.
* You can also pull the image directly from Docker Hub: `docker pull diemol/chrome-remote-cdp`