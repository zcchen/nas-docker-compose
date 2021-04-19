<?php
$CONFIG = [

/**
 * Set the default app to open on login. Use the app names as they appear in the
 * URL after clicking them in the Apps menu, such as documents, calendar, and
 * gallery. You can use a comma-separated list of app names, so if the first
 * app is not enabled for a user then Nextcloud will try the second one, and so
 * on. If no enabled apps are found it defaults to the Files app.
 *
 * Defaults to ``files``
 */
'defaultapp' => 'files',

/**
 * Enables transactional file locking.
 * This is enabled by default.
 *
 * Prevents concurrent processes from accessing the same files
 * at the same time. Can help prevent side effects that would
 * be caused by concurrent operations. Mainly relevant for
 * very large installations with many users working with
 * shared files.
 *
 * Defaults to ``true``
 */
//'filelocking.enabled' => true,
];
