# sersync

sersync docker image, easy to use.

### First step, startup `sersync` on host1 as `192.168.1.10`
```
docker run -d -v /some/dir:/syncdir -p 873:873 -e TARGET_HOST=192.168.1.11 --name sersync taojy123/sersync
```
*Note: Please publish the container's port 873 to host port 873, or use host network.*

### Second step, startup `sersync` on another host2 as `192.168.1.11`
```
docker run -d -v /some/dir:/syncdir -p 873:873 -e TARGET_HOST=192.168.1.10 --name sersync taojy123/sersync
```
*Note: This operation will overwrite the `/some/dir` directory in host1.*

### That's all done!
