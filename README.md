#  AutomergeWebsocketError

Demonstrates case where get repeated:

```
WEBSOCKET: Error reading websocket: The operation couldn’t be completed. Socket is not connected
```

To reproduce:

1. Start this app with wifi on
2. Once app has started then turn wifi off

Once you have done this many WEBSOCKET: Errors start happening. CPU Usage reported by Xcode goes from 0 to 60%. App does stay responsive (menus and such). Upon quitting app Xcode then beachballs for 5-10 seconds... as I guess mabye its cleaning out logging? Not sure.

I did a trace to see what's taking up the CPU and it seems like it's almost all logging related CPU. I'm not sure how to interpurt that. Still seems to me like the retry loop should slow down in this case and then error out eventually. This is from someone who's done very little network code, so I really don't know what proper behavior should be.
