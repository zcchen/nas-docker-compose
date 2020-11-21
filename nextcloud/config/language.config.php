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
'default_language' => 'zh',

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
'default_locale' => 'zh_CN',
];
