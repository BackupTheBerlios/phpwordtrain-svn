phpWordTrain - README

Author: Francisco Garcia Rodriguez <kalahan (at) users.berlios.de>
URL:    http://phpwordtrain.berlios.de
------------------------------------------

phpWordTrain is an application to assist people learning new languages. Most of
its job is giving you some place where to keep your new vocabulary. You let the
review sessions to phpWordTrain, it will ask your words and each time you hit 
the right answer, it will wait twice as long as last time before asking again.

However, if you prefer, you can change how often will those words show up again.
In your configuration file there are LEVELX constants, where X stands for the
number of days the word will be inactive.

This is alpha software, so remember to backup up your data every so often, and
if you loose data, don't heasitate and fill up a bug report.



--------------------
-- INSTALL
--------------------

This program should run in any computer with PHP and MySQL servers instaled.
Once you do, you must configure "config.inc" with your data. 

The initial database is placed on "lib/base.sql". Build a new database and
import the contents of that file.

After updating the configuration file and making sure your TMP dir is world
writable, you should be able to start using the application.

