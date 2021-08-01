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
    '{{LOCAL_DOMAIN_NAME}}',
    'nextcloud-nginx',
    'nextcloud-apache',
   ],

/**
 * Nextcloud attempts to detect the webroot for generating URLs automatically.
 * For example, if ``www.example.com/nextcloud`` is the URL pointing to the
 * Nextcloud instance, the webroot is ``/nextcloud``. When proxies are in use,
 * it may be difficult for Nextcloud to detect this parameter, resulting in
 * invalid URLs.
 */
'overwritewebroot' => '/nextcloud',

'trusted_proxies' => ['172.16.1.0/24', '172.16.10.0/24'],

/**
 * The URL of your proxy server, for example ``proxy.example.com:8081``.
 *
 * Note: Guzzle (the http library used by Nextcloud) is reading the environment
 * variables HTTP_PROXY (only for cli request), HTTPS_PROXY, and NO_PROXY by default.
 *
 * If you configure proxy with Nextcloud any default configuration by Guzzle
 * is overwritten. Make sure to set ``proxyexclude`` accordingly if necessary.
 *
 * Defaults to ``''`` (empty string)
 */
'proxy' => 'http://privoxy:8118',

/**
 * The optional authentication for the proxy to use to connect to the internet.
 * The format is: ``username:password``.
 *
 * Defaults to ``''`` (empty string)
 */
'proxyuserpwd' => '',

/**
 * List of host names that should not be proxied to.
 * For example: ``['.mit.edu', 'foo.com']``.
 *
 * Hint: Use something like ``explode(',', getenv('NO_PROXY'))`` to sync this
 * value with the global NO_PROXY option.
 *
 * Defaults to empty array.
 */
'proxyexclude' => [],

];
