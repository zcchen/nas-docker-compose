TODO
=============================

Features for NAS machine
-----------------------------
- [ ] nginx reversed proxy
  + [ ] find a reversed proxy docker solution.
    + [-] NOT good. "jwilder/nginx-proxy:alpine" solution
    + [ ] another solutions like pure nginx solution.
- [ ] https support (letsencrypt)
- [x] Unified Certification (openldap)
- [ ] SAML SSO
- [x] MySQL (MariaDB)
  + nested by multiple sub docker services.
- [x] docker monitoring (Docker Compose Solution)
- [x] nextcloud
  + [x] basic setup
  + [ ] integrade with LDAP
  + [ ] integrade with SAML SSO
- [?] ddns
- [ ] Unified Entrance (Heimall)
- [ ] frp local
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

Optimizings
-----------------------------
- [x] reselect the docker image for openldap, because current one can only support `admin` user with `admin` password
