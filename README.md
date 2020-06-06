# neilvision
we're gonna point a laser pointer at tennis balls

## Testing
```bash
docker build -t neilvision --build-arg user=$USER .
docker container run --device /dev/video0:/dev/video0 -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY --env QT_X11_NO_MITSHM=1 -p 5000:5000 -p 8888:8888 -v $HOME/.Xauthority:$HOME/.Xauthority neilvision
```