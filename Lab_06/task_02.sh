#!/bin/bash

ping_website() {
  local website=$1

  if ! ping -c 3 "$website" > /dev/null 2>&1 ; then
    echo "Website $website is reachable"
  else
    echo "Website $website is unreachable"
  fi
}

check_response_time() {
  website=$1
  response_time=$(curl -s -o /dev/null -w "%{time_total}\n" "$website")
  echo "Response time for $website is $response_time seconds"
}

check_http_status() {
  website=$1
  http_status=$(curl -s -o /dev/null -w "%{http_code}" "$website")
  echo "HTTP status for $website is $http_status"
}

websites=("http://example.com" "http://google.com" "http://yahoo.com")

for site in "${websites[@]}"; do
  ping_website "$site"
  check_response_time "$site"
  check_http_status "$site"
  echo "--------------------------------------"
done
