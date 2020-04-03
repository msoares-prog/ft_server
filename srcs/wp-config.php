<?php
/* vim: set expandtab sw=4 ts=4 sts=4: */
/**
* As configurações básicas do WordPress
*
* Este arquivo contém as seguintes configurações:
*
* * Configurações do MySQL
* * Chaves secretas
* * Prefixo do banco de dados
* * ABSPATH
*
* @link https://wordpress.org/support/article/editing-wp-config-php/
*
* @package WordPress
*/
// ** Configurações do MySQL - Você pode pegar estas informações com o serviço de hospedagem ** //
/** O nome do banco de dados do WordPress */
define('DB_NAME', 'wordpress');
/** Usuário do banco de dados MySQL */
define('DB_USER', 'admin');
/** Senha do banco de dados MySQL */
define('DB_PASSWORD', 'admin');
/** Nome do host do MySQL */
define('DB_HOST', 'localhost');
/** Charset do banco de dados a ser usado na criação das tabelas. */
define('DB_CHARSET', 'utf8');
/** O tipo de Collate do banco de dados. Não altere isso se tiver dúvidas. */
define('DB_COLLATE', '');
/**#@+
* Chaves únicas de autenticação e salts.
*
* Altere cada chave para um frase única!
* Você pode gerá-las
* usando o {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org
* secret-key service}
* Você pode alterá-las a qualquer momento para invalidar quaisquer
* cookies existentes. Isto irá forçar todos os
* usuários a fazerem login novamente.
*
* @since 2.6.0
*/
define('AUTH_KEY',         'nk|n 4}r7Wqb~iffoCwLEM6:>qULMC*LL4BuyVnTyErRI`GyZ~[4LTZhLexlWb0D');
define('SECURE_AUTH_KEY',  '4BJ&;thP9[m[3W;r<=+|8u1]K4ZL+GLHH-gw2^2*V|XKFpWjlb^t$;o`hc5YRmA]');
define('LOGGED_IN_KEY',    '5zVxy1 ?rl]tB9Yv-HEOpUZ&CG|Oa-[ P_dQ=|&}&4CSoD#.YB=c*fPg5aUQO}Pt');
define('NONCE_KEY',        ' Q>)N8% +k^<qWIp; G81S%-R!p2t8EhMz+l{Q#.ZeA#/6^VWTF nDdMh0M%cswr');
define('AUTH_SALT',        '`:B-F3D@R|!n E4%q[%&$<&uZkUYSx,t~L*0*`:&iUb7?6`+#YchT(`AV$K2pWCw');
define('SECURE_AUTH_SALT', ']bN5CDHe3- m+46g7Y^TtdEHze# TyoiYd2.WvGe^IVK-W!Ej7z{YM}^/mxB3D4z');
define('LOGGED_IN_SALT',   'Tv(8Pis;=W.:-AhhT.w=[:&auD$s/z]J#}k9EX%&S(- ~S){.^{0 oqsJZ}W0UQy');
define('NONCE_SALT',       'ryAxi/p<<}rvlDSr5&)W9^A9q*:5JvPTD$DptM%x$M[]?s_$s58|s3T//}o~_i0B');
//define('AUTH_KEY',         'coloque a sua frase única aqui');
//define('SECURE_AUTH_KEY',  'coloque a sua frase única aqui');
//define('LOGGED_IN_KEY',    'coloque a sua frase única aqui');
//define('NONCE_KEY',        'coloque a sua frase única aqui');
//define('AUTH_SALT',        'coloque a sua frase única aqui');
//define('SECURE_AUTH_SALT', 'coloque a sua frase única aqui');
//define('LOGGED_IN_SALT',   'coloque a sua frase única aqui');
//define('NONCE_SALT',       'coloque a sua frase única aqui');
/**#@-*/
/**
* Prefixo da tabela do banco de dados do WordPress.
*
* Você pode ter várias instalações em um único banco de dados se você der
* um prefixo único para cada um. Somente números, letras e sublinhados!
*/
$table_prefix  = 'wp_';
/**
* Para desenvolvedores: Modo de debug do WordPress.
*
* Altere isto para true para ativar a exibição de avisos
* durante o desenvolvimento. É altamente recomendável que os
* desenvolvedores de plugins e temas usem o WP_DEBUG
* em seus ambientes de desenvolvimento.
*
* Para informações sobre outras constantes que podem ser utilizadas
* para depuração, visite o Codex.
*
* @link https://wordpress.org/support/article/editing-wp-config-php/
*/
define('WP_DEBUG', false);
/* Isto é tudo, pode parar de editar! :) */
/** Caminho absoluto para o diretório WordPress. */
if ( !defined('ABSPATH') )
   define('ABSPATH', dirname(__FILE__) . '/');
/** Configura as variáveis e arquivos do WordPress. */
require_once(ABSPATH . 'wp-settings.php');