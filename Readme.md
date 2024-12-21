If you encounter jack issues regarding unbound user variable, Edit out/host/linux-x86/bin/jack and add these lines near the top (after the shebang line):

```
USER=${USER:-builder}
```

Any other jack errors (where it isnt able to use the server) could be regarding ports or fixed by this: https://stackoverflow.com/questions/45794488/jack-server-failed-to-restart/67710690#%E2%80%A6


Building dockerimage can be done by running `make` 

Running it: 
```
sudo docker run --rm -it -v ~/workdir:/home/builder/android/workdir mlm-games/aosp_7.1
```
