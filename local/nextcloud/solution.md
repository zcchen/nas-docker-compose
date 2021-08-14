The Solution for How to Handle the Storage Area
====================================================

The solution map is blow.

```
+-----------------------------------------+            +-------------------------------------+
|           Nextcloud Users               |            |  Public Users, e.g. Video Services  |
+-----------------------------------------+            +-------------------------------------+
        |                               \                                              |
        |       (Use Oauth2 interface to \              (Read-only for anonymous user) |
        |         validate the privilege) \           (Writable for the "public" user) |
        |                                  \                                           |
+------------------------------------+   +-------------------------+     +-------------------+
| Nextcloud Mono Entrance, by using  |   | Web-base services, e.g. |     |   Samba Service   |
|   the external storage plugin.     |   |   aria2 web GUI, ...    |     |                   |
+------------------------------------+   +-------------------------+     +-------------------+
        |                            \                  |                  /
        |                             \                 |                 /
        |                              \                |                /
        |                               \               |               /
+---------------------------------+     +-------------------------------+
| Nextcloud Files, docker volume: |     |   Local File, docker volume:  |
|   nextcloud-data                |     |        nextcloud-samba        |
+---------------------------------+     +-------------------------------+
```
