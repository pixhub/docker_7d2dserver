#!/bin/bash

STEAMCMD="/home/7d2d/steamcmd/steamcmd.sh"
INSTALL_DIR="/home/7d2d/7d2d-server"

fn_checkupdates () {
                   echo "==> Checking for Updates"
                   $STEAMCMD +login nonymous \
                             +force_install_dir $INSTALL_DIR \
                             +app_update 294420 validate \
                             +quit
                   if [ $? = 0 ]
                      then
                          echo "==> Server is Up-to-Date"
                      else
                          echo "==> An error occured, please restart the server"
                          exit 1
                   fi
}

fn_setvars () {
              if [ ! -z $PORT ]
                 then
                     sed -i -e "s/ServerPort" 				value='26900'/ServerPort" 				value='$PORT'/g" /home/7d2d/7d2d-server/serverconfig.xml
              fi
}

fn_startserver () {
                  /home/7d2d/7d2d-server/7DaysToDieServer.x86_64 -configfile=/home/7d2d/7d2d-server/serverconfig.xml
}
