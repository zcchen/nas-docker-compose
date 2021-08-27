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
  + [x] Plugins for nextcloud
    * [x] calenda, and other groupware. ref: https://docs.nextcloud.com/server/latest/user_manual/en/pim/index.html
  + [x] set the default app to be `file`
  + [x] setup the tunings, like `redis` +  ...
  + [x] reinstallation failed if the app container is destroyed. (skip)
- [x] separate this project into `server` & `local`
  + [x] Update the default `docker-compose` project name
- [ ] DNS prodivers:
  + [x] local DNS provider, for LAN zone usage
    * [ ] `dnsmasq` + `felixonmars/dnsmasq-china-list`
  + [x] server DNS simulator, for Internet accessing
    * [x] `dnsmasq` bind the Address with server VM
  + [x] Auto restart after time-updated scripts. (healthy check is useless for this.)
- [x] frp
  + [x] local & server basic setup
  + [x] server port forwarding:
    * [x] basic feature implemented
    * [x] missing some test cases, e.g. `${SERVER_DOMAIN_NAME}`, `*.${SERVER_DOMAIN_NAME}`, `*.*.${LOCAL_DOMAIN_NAME}`
- [x] https support (letsencrypt)
  + [x] Basic features and able to use
  + [x] change the CA from `letsencrypt test` to `letsencrypt`
  + [x] update the acme.sh command from `--issue` to `--issue` + `--cron`, in order to reduce the API limits.
- [x] proxy setup
  + [x] local proxy (ss + v2ray plugin), privoxy
  + [x] server proxy provider (ss + v2ray plugin)
- [x] index page. recommending: use `github.com/bastienwirtz/homer`
  + [x] serve its release file packs
  + [x] adapt the config with my requirements.
- [ ] Use `docsify` to mark down the setup config.
  + [x] Added link at `homer/cn.yml` & `homer/en.yml`.
  + [x] prepare the setup pages with `docsify`.
  + [ ] write down the config setup.
- [ ] English Readme page.
- [ ] Setup Identity Provider (IdP)
  + tips 1: https://www.nginx.com/blog/validating-oauth-2-0-access-tokens-nginx/
  + tips 2: https://help.nextcloud.com/t/using-nextcloud-as-an-authentication-backend/32736
  + [ ] Identification backend service, e.g. `python flask` or `nginx` mod
- [ ] Setup a `samba` server to hold public files, like downloads, movies, softwares & so on.
  + [x] `samba` server
  + [ ] auto download (aria2, aria2-ng)
- [ ] Only Office integrating, ref:
  + [ ] Use its official docker image to hold this service.
    * [https://im.salty.fish/index.php/archives/nextcloud-onlyoffice.html][https://im.salty.fish/index.php/archives/nextcloud-onlyoffice.html]
    * [https://blog.csdn.net/Aria_Miazzy/article/details/85028182][https://blog.csdn.net/Aria_Miazzy/article/details/85028182]


Another docker-compose Project
-----------------------------
- [ ] media center (commercial: emby server / opensource: jellyfin)
- [ ] backup + sync service


System-based Service
-----------------------------
- [ ] server monitoring (cockpit)

