If you encounter jack issues regarding unbound user variable, Edit out/host/linux-x86/bin/jack and add these lines near the top (after the shebang line):

```
USER=${USER:-builder}
```

Any other jack errors (where it isnt able to use the server) could be regarding ports or fixed by this: https://stackoverflow.com/questions/45794488/jack-server-failed-to-restart/67710690#%E2%80%A6
