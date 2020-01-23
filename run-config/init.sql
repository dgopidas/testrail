create database if not exists testrail collate utf8_bin;

GRANT ALL PRIVILEGES ON testrail.* TO 'testrail'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

use testrail;

SET autocommit=0;
source /opt/import.sql;
COMMIT;


