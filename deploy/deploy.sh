#!/bin/bash
# Load RVM into a shell session *as a function*
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then

  # First try to load from a user install
  source "$HOME/.rvm/scripts/rvm"

elif [[ -s "/usr/local/rvm/scripts/rvm" ]] ; then

  # Then try to load from a root install
  source "/usr/local/rvm/scripts/rvm"

else

  printf "ERROR: An RVM installation was not found.\n"

fi
cd /var/www/trec
rvm use 2.1.2
bundle
if [ -a ../tmp/pids/server.pid ]
  then
    pid=`cat ../tmp/pids/server.pid`
    kill -15 $pid
fi

nohup rails server -b 0.0.0.0 -p 9000 &
