# sersync

sersync docker image, easy to use.


First step, startup `sersync` on host 192.168.1.10
```
docker run -d -v /some/dir/:/syncdir -p 873:873 -e TARGET_HOST=192.168.1.11 taojy123/sersync
```


Second step, startup `sersync` on another host 192.168.1.11
```
docker run -d -v /some/dir/:/syncdir -p 873:873 -e TARGET_HOST=192.168.1.10 taojy123/sersync
```

It's all done.

*Note: Please publish the container's port 873 to host port 873, or use host network.*

