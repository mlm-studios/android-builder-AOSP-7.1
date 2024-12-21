Any other jack errors (where it isnt able to use the server) could be regarding ports or fixed by this: https://stackoverflow.com/questions/45794488/jack-server-failed-to-restart/67710690#%E2%80%A6


Building dockerimage can be done by running `make` 

Running it with a folder from your host system: 
```
sudo docker run --rm -it -v ~/workdir:/home/builder/android/workdir mlm-games/aosp_7.1
```

Added a docker env var USER, so ignore below stuff

> If you encounter jack issues regarding unbound user variable, just set your user from the output of `whoami` (should be builder), and set user to that `USER=$(whoami)`