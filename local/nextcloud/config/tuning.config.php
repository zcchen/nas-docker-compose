<?php

$CONFIG = [

/**
 * Memory caching backend for distributed data
 *
 * * Used for installation-specific data, e.g. database caching
 * * If unset, defaults to the value of memcache.local
 *
 * Defaults to ``none``
 */
'memcache.distributed' => '\OC\Memcache\Redis',
'memcache.local' => '\OC\Memcache\Redis',
'memcache.locking' => '\\OC\\Memcache\\Redis',
'filelocking.enabled' => true,

/**
 * Connection details for redis to use for memory caching in a single server configuration.
 *
 * For enhanced security it is recommended to configure Redis
 * to require a password. See http://redis.io/topics/security
 * for more information.
 */
'redis' => [
	'host' => 'nextcloud-redis', // can also be a unix domain socket: '/tmp/redis.sock'
	'port' => 6379,
	'timeout' => 10.0,
],

];
