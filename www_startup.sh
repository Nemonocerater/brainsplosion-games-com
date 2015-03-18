
### Constants and Variables
TEMP_DIR=~/www_setup_temp
INSTALL_LOG=$TEMP_DIR/log

GIT_TOKEN=009133ccc14fdd462f6efc40aa593065f71a8ad4


### Become Root and Move to Install Directory
sudo su
mkdir $TEMP_DIR
cd $TEMP_DIR

### Install Node.js
echo "=::=YUM EPEL" >> $INSTALL_LOG
yum install epel-release -y >> $INSTALL_LOG
echo "=::=YUM NODE" >> $INSTALL_LOG
yum install nodejs -y >> $INSTALL_LOG
echo "=::=YUM NPM" >> $INSTALL_LOG
yum install npm -y >> $INSTALL_LOG

### Install Forever
echo "=::=NPM FOREVER" >> $INSTALL_LOG
npm install forever -g -y >> $INSTALL_LOG

### Install Git
echo "=::=YUM GIT" >> $INSTALL_LOG
yum install git -y >> $INSTALL_LOG

### Clone Project
cd /var
echo "=::=GIT CLONE" >> $INSTALL_LOG
git clone https://$GIT_TOKEN:x-oauth-basic@github.com/Nemonocerater/brainsplosion-games-com.git

### Run Server
cd /var/brainsplosion-games-com
echo "=::=Forever" >> $INSTALL_LOG
forever start server.js >> $INSTALL_LOG
