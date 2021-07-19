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
  + [x] nextcloud-app internet connection
    * [x] need proxy for nextcloud to access api.nextcloud.com
  + [x] nextcloud upload issue, related to `nginx` setup
    * [x] done with `traefik` solution.
    * [x] port back to `nginx`.
  + [ ] Plugins for nextcloud
    * [ ] calenda
    * [ ] others
  + [x] set the default app to be `file`
  + [x] setup the tunings, like `redis` +  ...
  + [ ] reinstallation failed if the app container is destroyed.
- [x] separate this project into `server` & `local`
  + [x] Update the default `docker-compose` project name
- [x] DNS prodivers:
  + [x] local DNS provider, for LAN zone usage
    * [ ] `dnsmasq` + `felixonmars/dnsmasq-china-list`
  + [x] server DNS simulator, for Internet accessing
    * [x] `dnsmasq` bind the Address with server VM
  + [ ] Auto restart after time-updated scripts. (healthy check is useless for this.)
- [x] frp
  + [x] local & server basic setup
  + [x] server port forwarding:
    * [x] basic feature implemented
    * [x] missing some test cases, e.g. `${SERVER_DOMAIN_NAME}`, `*.${SERVER_DOMAIN_NAME}`, `*.*.${LOCAL_DOMAIN_NAME}`
- [ ] https support (letsencrypt)
  + [x] Basic features and able to use
  + [ ] change the CA from `letsencrypt test` to `letsencrypt`
  + [?] update the acme.sh command from `--issue` to `--issue` + `--cron`, in order to reduce the API limits.
- [x] proxy setup
  + [x] local proxy (ss + v2ray plugin), privoxy
  + [x] server proxy provider (ss + v2ray plugin)
- [x] index page. recommending: use `github.com/bastienwirtz/homer`
  + [x] serve its release file packs
  + [x] adapt the config with my requirements.
  + [ ] setup `readme.html`.
- [ ] docker image auto triggering.
  + [ ] auto trigger specified docker image restart. use case: dnsmasq-config updates, let `dnsmasq` restarting
  + [ ] auto trigger specified docker image every month. use case: rerun the `letsencrypt` once per week / month

- [ ] onlyoffice
- [ ] gitlab
- [ ] artifactory (JFrog)
- [ ] auto download (aria2, aria2-ng)
- [ ] server monitoring (cockpit)

others
-----------------------------
- [ ] media center (commercial: emby server / opensource: jellyfin)

