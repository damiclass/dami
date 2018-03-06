wget http://mirrors.163.com/.help/CentOS6-Base-163.repo
mv -v  CentOS6-Base-163.repo  /etc/yum.repos.d/
sed -i "s/\$releasever/6.9/g" /etc/yum.repos.d/CentOS6-Base-163.repo
yum makecache

mkdir ~/down || echo "down dir exist"
cd /root/down

 yum remove postfix* 

rpm -qa | grep mysql-libs | xargs rpm -e

rpm -e httpd
rpm -e mysql
rpm -e php
yum -y remove httpd
yum -y remove mysql
yum -y remove php
yum install ncurses-devel -y
\rm -vf CMakeCache.txt

yum install openssl* git
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
yum -y install make gcc gcc-c++ gcc-g77 flex bison file libtool libtool-libs autoconf kernel

groupadd mysql  
useradd -s /sbin/nologin -g mysql -M mysql 
tail -1 /etc/passwd    


wget --no-check-certificate http://www.cmake.org/files/v2.8/cmake-2.8.12.2.tar.gz 
tar zxvf cmake-2.8.12.2.tar.gz 
cd cmake-2.8.12.2 && ./configure 
make && make install
cd /root/down
#--------------------------------
wget http://dev.mysql.com/get/Downloads/MySQL-5.6/mysql-5.6.33.tar.gz --no-check-certificate
tar zxvf mysql-5.6.33.tar.gz
cd mysql-5.6.33
cmake \
-DCMAKE_INSTALL_PREFIX=/usr/local/mysql \
-DMYSQL_DATADIR=/usr/local/mysql/data \
-DSYSCONFDIR=/etc \
-DWITH_MYISAM_STORAGE_ENGINE=1 \
-DWITH_INNOBASE_STORAGE_ENGINE=1 \
-DWITH_MEMORY_STORAGE_ENGINE=1 \
-DWITH_READLINE=1 \
-DMYSQL_UNIX_ADDR=/var/lib/mysql/mysql.sock \
-DMYSQL_TCP_PORT=3306 \
-DENABLED_LOCAL_INFILE=1 \
-DWITH_PARTITION_STORAGE_ENGINE=1 \
-DEXTRA_CHARSETS=all \
-DDEFAULT_CHARSET=utf8 \
-DDEFAULT_COLLATION=utf8_general_ci \
-DMYSQL_USER=mysql \
-DWITH_DEBUG=0 \
-DWITH_SSL=bundled 
make && make install
#----

chmod +w /usr/local/mysql
chown -R mysql:mysql /usr/local/mysql


cd support-files/ 

mv -v /etc/my.cnf     /etc/my.cnf.bak
\cp -vf my-default.cnf  /etc/my.cnf 


/usr/local/mysql/scripts/mysql_install_db --user=mysql --basedir=/usr/local/mysql --datadir=/usr/local/mysql/data

cp support-files/mysql.server /etc/init.d/mysqld   
chmod +x /etc/init.d/mysqld 
chkconfig mysqld on
service mysqld start

echo 'PATH=/usr/local/mysql/bin:$PATH' >> /etc/profile
echo 'export PATH' >> /etc/profile
source /etc/profile


echo "Enter new root pwd for mysql"
/usr/local/mysql/bin/mysqladmin -uroot -p password
## 这里先不输入密码 然后再输入两次root
#-------
cd  /root/down

wget http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.14.tar.gz
tar zxvf libiconv-1.14.tar.gz
cd libiconv-1.14
./configure --prefix=/usr/local/libiconv
make && make install
cd ..
#--------

# libmcrypt 连接不上 需要手动别的地方下载
#wget http://iweb.dl.sourceforge.net/project/mcrypt/Libmcrypt/2.5.8/libmcrypt-2.5.8.tar.gz
tar zxvf libmcrypt-2.5.7.tar.gz
cd libmcrypt-2.5.7
./configure
make && make install
cd ..
#------

# mhash 得从别的地方下载

tar -xzvf mhash-0.9.9.9.tar.gz
cd mhash-0.9.9.9
./configure
make && make install
cd ..

#------

echo '/usr/local/lib/' >> /etc/ld.so.conf
ldconfig

wget http://jaist.dl.sourceforge.net/project/mcrypt/MCrypt/2.6.8/mcrypt-2.6.8.tar.gz
tar zxvf mcrypt-2.6.8.tar.gz
cd mcrypt-2.6.8
./configure
make && make install
cd ..

# 编译mcrypt可能会报错：/bin/rm: cannot remove `libtoolT’: No such file or directory

# https://www.linuxidc.com/Linux/2016-10/136047.htm 方法

yum install libxml2* -y  

yum install libcurl -y
yum install curl curl-devel -y
yum -y install libjpeg-devel

yum install libpng -y

yum install libpng-devel -y

yum -y install freetype-devel
yum -y install libXpm-devel
yum -y install libpng-devel
yum -y install libvpx-devel
yum -y install enchant-devel
yum -y install libcurl-devel


wget http://au1.php.net/get/php-5.6.26.tar.gz/from/this/mirror
mv mirror   php-5.6.26.tar.gz
tar zxvf php-5.6.26.tar.gz
cd php-5.6.26
./configure --prefix=/usr/local/php --with-config-file-path=/usr/local/php/etc --enable-fpm --with-fpm-user=www --with-fpm-group=www --with-mysql=mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-iconv-dir --with-freetype-dir --with-jpeg-dir --with-png-dir --with-zlib --with-libxml-dir=/usr --enable-xml --disable-rpath --enable-magic-quotes --enable-safe-mode --enable-bcmath --enable-shmop --enable-sysvsem --enable-inline-optimization --with-curl --with-curlwrappers --enable-mbregex --enable-mbstring --with-mcrypt --enable-ftp --with-gd --enable-gd-native-ttf --with-openssl --with-mhash --enable-pcntl --enable-sockets --with-xmlrpc --enable-zip --enable-soap --without-pear --with-gettext --disable-fileinfo --enable-maintainer-zts
# configure: error: xml2-config not found. Please check your libxml2 installation.

make && make install

mv /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf
cp php.ini-production /usr/local/php/etc/php.ini

cp sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm
chmod +x /etc/init.d/php-fpm 
chkconfig --add php-fpm      
chkconfig php-fpm on     

groupadd www
useradd -s /sbin/nologin -g www -M www
#----
cd /root/down






