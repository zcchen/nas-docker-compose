TODO
=============================

Features for NAS machine
-----------------------------
- [x] nginx reversed proxy
  + [x] find a reversed proxy docker solution.
- [ ] `traefik` might be better reversed proxy
- [x] MySQL (MariaDB)
  + nested by multiple sub docker services.
- [x] docker monitoring (Docker Compose Solution)
- [x] nextcloud
  + [x] basic setup
  + [x] cond service
  + [x] Redis cache
  + [ ] nextcloud-app internet connection
    * [ ] need proxy for nextcloud to access api.nextcloud.com
  + [ ] nextcloud upload issue, related to `nginx` setup
  + [ ] Plugins for nextcloud
    * [ ] calenda
    * [ ] others
  + [ ] set the default app to be `file`
- [?] ddns
- [?] Unified Entrance (Heimall)
- [ ] frp local
- [ ] https support (letsencrypt)
- [ ] onlyoffice
- [ ] gitlab
- [ ] artifactory (JFrog)
- [ ] local proxy (ss + r2ray)
- [ ] auto download (aria2, aria2-ng)
- [ ] server monitoring (cockpit)

Features for another machines
-----------------------------
- [ ] CI (Jerkins)
- [ ] media center (commercial: emby server / opensource: jellyfin)
- [ ] frp server

