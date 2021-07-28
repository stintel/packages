#!/bin/sh

echo "Testing $1"

case "$1" in
	openvswitch)
		# shellcheck disable=SC1091
		. /etc/rc.common
		. /etc/init.d/openvswitch

		ovs_bridge_parse_datapath_id 0123456789abcdef || exit 1
		ovs_bridge_parse_datapath_id thisshouldfail && exit 1
		;;
esac
