#!/bin/bash

case "$1" in
-connect)
  openvpn3 session-start --config "$2"
  echo "openvpn3 get started...";;
-disconnect)
  session=$(openvpn3 sessions-list | grep Path | xargs)
  split_result=($session)
  path=${split_result[1]}
  echo "closing session ${path}"
  openvpn3 session-manage --path="${path}" --disconnect;;
*) echo "$1 incorrect option, can be -connect <file_path> and -disconnect";;
esac