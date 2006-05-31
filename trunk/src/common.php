<?php 
if ( !defined("CUEWORD_CONFIGURATION") ) 
{
	define("CUEWORD_CONFIGURATION",1);

    require 'config.inc';
    require LOCALDIR.'/lib/Smarty/Smarty.class.php';
    
    function &Template()
    {
        $smarty = new Smarty();
        $smarty->template_dir = LOCALDIR."/smarty/templates";
        $smarty->compile_dir = LOCALDIR."/smarty/templates_c";
        $smarty->cache_dir = LOCALDIR."/smarty/cache";
        $smarty->config_dir = LOCALDIR."/smarty/configs";
        
        // Predefined words
        $smarty->assign('site', HOMESITE);
        return $smarty;
    }

    function Error()
    {
        $numargs = func_num_args();
        $smarty= Template();
        
        // Simple warning message
        if ($numargs == 1)
        {
            $msg = func_get_arg(0);
            $smarty->assign('msg', $msg);
            $smarty->display('error.tpl');
        }
        die;
    }
    
    function Msg($msg)
    {
        $smarty = Template();
        $smarty->assign('msg', $msg);
        $smarty->display('msg.tpl');
        die;
    }

    
    //////////////////////////////////////////////////////////
    // Global checks 
    //////////////////////////////////////////////////////////
    if ( ! mysql_pconnect(DB_HOST,DB_USER,DB_PASS) ) 
        Error("There's no connection with the database");

    if ( ! mysql_select_db(DB_NAME) )
        Error("There's no connection with the database");
}
?>
