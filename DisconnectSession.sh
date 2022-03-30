#!/bin/bash
session=$(openvpn3 sessions-list | grep Path | xargs)
split_result=($session)
path=${split_result[1]}
echo "closing session ${path}"

openvpn3 session-manage --path="${path}" --disconnect