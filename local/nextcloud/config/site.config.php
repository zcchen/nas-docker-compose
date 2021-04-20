<?php

$CONFIG = [

/**
 * Your list of trusted domains that users can log into. Specifying trusted
 * domains prevents host header poisoning. Do not remove this, as it performs
 * necessary security checks.
 * You can specify:
 *
 * - the exact hostname of your host or virtual host, e.g. demo.example.org.
 * - the exact hostname with permitted port, e.g. demo.example.org:443.
 *   This disallows all other ports on this host
 * - use * as a wildcard, e.g. ubos-raspberry-pi*.local will allow
 *   ubos-raspberry-pi.local and ubos-raspberry-pi-2.local
 * - the IP address with or without permitted port, e.g. [2001:db8::1]:8080
 *   Using TLS certificates where commonName=<IP address> is deprecated
 */
'trusted_domains' =>
   [
    '127.0.0.1',
    '192.168.1.0/24',
    'localhost',
    '*.localhost',
    'nextcloud.{{DOMAIN_NAME}}',
   ],

/**
 * Nextcloud attempts to detect the webroot for generating URLs automatically.
 * For example, if ``www.example.com/nextcloud`` is the URL pointing to the
 * Nextcloud instance, the webroot is ``/nextcloud``. When proxies are in use,
 * it may be difficult for Nextcloud to detect this parameter, resulting in
 * invalid URLs.
 */
'overwritewebroot' => '/',

'trusted_proxies' => ['172.16.1.0/24', '172.16.10.0/24'],
];
