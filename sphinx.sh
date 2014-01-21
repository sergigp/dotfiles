#!/bin/bash

case "${1:-''}" in
  'start')
        # put the command to start sphinx
  	/usr/bin/searchd
        ;;
  'stop')
        # stop command here
	/usr/bin/searchd --stop
        ;;
  'status')
        # stop command here
        /usr/bin/searchd --status
        ;;
  'restart')
        # restart command here
	/usr/bin/searchd --stop && /usr/bin/searchd
        ;;
  *)
        echo "Usage: $SELF start|stop|restart"
        exit 1
        ;;
esac