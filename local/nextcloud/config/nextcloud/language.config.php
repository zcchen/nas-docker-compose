<?php
$CONFIG = [
/**
 * This sets the default language on your Nextcloud server, using ISO_639-1
 * language codes such as ``en`` for English, ``de`` for German, and ``fr`` for
 * French. It overrides automatic language detection on public pages like login
 * or shared items. User's language preferences configured under "personal ->
 * language" override this setting after they have logged in. Nextcloud has two
 * distinguished language codes for German, 'de' and 'de_DE'. 'de' is used for
 * informal German and 'de_DE' for formal German. By setting this value to 'de_DE'
 * you can enforce the formal version of German unless the user has chosen
 * something different explicitly.
 *
 * Defaults to ``en``
 */
'default_language' => 'zh_CN',
#'force_language' => 'zh_CN',

/**
 * This sets the default locale on your Nextcloud server, using ISO_639
 * language codes such as ``en`` for English, ``de`` for German, and ``fr`` for
 * French, and ISO-3166 country codes such as ``GB``, ``US``, ``CA``, as defined
 * in RFC 5646. It overrides automatic locale detection on public pages like
 * login or shared items. User's locale preferences configured under "personal
 * -> locale" override this setting after they have logged in.
 *
 * Defaults to ``en``
 */
'default_locale' => 'CN',
'default_phone_region' => 'CN',

/**
 * The timezone for logfiles. You may change this; see
 * http://php.net/manual/en/timezones.php
 *
 * Defaults to ``UTC``
 */
'logtimezone' => 'Asia/Shanghai',

/**
 * Which domains to request to determine the availability of an Internet
 * connection. If none of these hosts are reachable, the administration panel
 * will show a warning. Set to an empty list to not do any such checks (warning
 * will still be shown).
 *
 * Defaults to the following domains:
 *
 *  - www.nextcloud.com
 *  - www.startpage.com
 *  - www.eff.org
 *  - www.edri.org
 */
'connectivity_check_domains' => [
	'www.nextcloud.com',
	'www.baidu.com',
],
];
