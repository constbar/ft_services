<?php
define( 'DB_NAME', 'WordPress_db' );
define( 'DB_USER', 'admin' );
define( 'DB_PASSWORD', 'admin' );
define( 'DB_HOST', 'mysql-svc:3306' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
define('AUTH_KEY',         '@}!pQd{,);g<iF*T5ecn+oL8]vvyar6B@|+{#+5gF&1E:{Sqwb_1661Z3JeaYB|E');
define('SECURE_AUTH_KEY',  'tOM_sdw_;LIh-A|]S%lXb;K%fITD<~YPMke[6-T./-Ei6ZB##8T4R=n}+oQbirTK');
define('LOGGED_IN_KEY',    'L%!H}eFv-k5Wy-d0!c7jN4PX4k..}8>eltw)Yl_O]ejz@F%}%4CrV|fIj $}x:F&');
define('NONCE_KEY',        'WX}DR)VKc4/$/f;8z][OXb%UK*R?2TE6|?|k+6Par0q%:y:/q-aU9KbE(_A@ r4z');
define('AUTH_SALT',        'hsd{mzy~-gvLz^iwTix<?TxYs(i*.,!1ou%%BR!tK-O9_$~q/H@hV%s3GiH E*+G');
define('SECURE_AUTH_SALT', '{8r#DoGO[[4&It2[.$?2./EXNJ<e$Ce=]Z}-L+Nme,FjgF>{4i)Uv];D.=5Me;GK');
define('LOGGED_IN_SALT',   'z~Q2-=u9^*hVzO/g|+b)r~m%Zsk.g4#Fn0R9~2 Th~ l|5-}-XeWC#`Qt<Way;W`');
define('NONCE_SALT',       '4kSG]6+{/iBGQ#^}~o3&Ob8}->@,oavC3bY#u|`tx>aTV?E=dj,!jY4L^kL%E)*7');
$table_prefix = 'wp_';
define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}
require_once ABSPATH . 'wp-settings.php';