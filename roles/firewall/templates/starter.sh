#! /bin/sh
# /etc/init.d/firewall
#
# Firewall init script, to be used with /etc/firewall.bash by Jeff Geerling.
#
# @author Jeff Geerling

### BEGIN INIT INFO
# Provides:          firewall
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start firewall at boot time.
# Description:       Enable the firewall.
### END INIT INFO

# Carry out specific functions when asked to by the system
case "$1" in
  start)
    echo "Starting firewall."
    ./firewall.sh
    ;;
  stop)
    echo "Stopping firewall."
    iptables -F
    if [ -x "$(which ip6tables 2>/dev/null)" ]; then
        ip6tables -F
    fi
    ;;
  restart)
    echo "Restarting firewall."
    .firewall.sh
    ;;
  status)
    echo -e "`iptables -L -n`"
    EXIT=4 # program or service status is unknown
    NUMBER_OF_RULES=$(iptables-save | grep '^\-' | wc -l)
    if [ 0 -eq $NUMBER_OF_RULES ]; then
        EXIT=3 # program is not running
    else
        EXIT=0 # program is running or service is OK
    fi
    exit $EXIT
    ;;
  *)
    echo "Usage: /etc/init.d/firewall {start|stop|status|restart}"
    exit 1
    ;;
esac

exit 0
