#!/bin/bash
echo 'Current IP Address: '
IP=$(curl https://ipinfo.io/ip -s)
echo $IP
LOCATION=$(curl https://freegeoip.net/xml/$IP -s)
COUNTRY=$(echo $LOCATION | grep -o -P '(?<=<CountryName>).*(?=</CountryName>)')
REGION=$(echo $LOCATION | grep -o -P '(?<=<RegionName>).*(?=</RegionName>)')
CITY=$(echo $LOCATION | grep -o -P '(?<=<City>).*(?=</City>)')
ZIPCODE=$(echo $LOCATION | grep -o -P '(?<=<ZipCode>).*(?=</ZipCode>)')
echo "$COUNTRY - $CITY, $REGION $ZIPCODE"
