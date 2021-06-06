TODO
=============================

main
-----------------------------
- [x] reset local port from `1080 + 10443` back to `80 + 443`
  + [x] Bug fixing: Both traefik return 404 if both traefik are running.
  + [x] Update local debugging solution with vagrant
- [x] nginx reversed proxy
  + [x] find a reversed proxy docker solution.
- [x] `traefik` might be better reversed proxy
- [x] MySQL (MariaDB)
  + nested by multiple sub docker services.
- [x] docker monitoring (Docker Compose Solution)
- [x] nextcloud
  + [x] basic setup
  + [x] cond service
  + [x] Redis cache
  + [ ] nextcloud-app internet connection
    * [ ] need proxy for nextcloud to access api.nextcloud.com
  + [x] nextcloud upload issue, related to `nginx` setup
    * [x] done with `traefik` solution.
  + [ ] Plugins for nextcloud
    * [ ] calenda
    * [ ] others
  + [x] set the default app to be `file`
  + [ ] setup the tunings, like `redis` +  ...
- [ ] proxy setup
  + [ ] local proxy (ss + obfs), privoxy, trustable DNS solution
  + [ ] server proxy provider (ss + obfs)
- [ ] index page, e.g. `linuxserver/heimdall:latest` or self-made
- [x] separate this project into `server` & `local`
  + [x] Update the default `docker-compose` project name
- [ ] local DNS provider, `unbound`, or `dnsmasq` + `felixonmars/dnsmasq-china-list`
- [ ] frp
  + [ ] local
  + [ ] server
- [ ] https support (letsencrypt)
- [ ] onlyoffice
- [ ] gitlab
- [ ] artifactory (JFrog)
- [ ] auto download (aria2, aria2-ng)
- [ ] server monitoring (cockpit)

others
-----------------------------
- [ ] media center (commercial: emby server / opensource: jellyfin)

