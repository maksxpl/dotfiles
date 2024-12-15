#!/usr/bin/env bash

UPDATES=`checkupdates | wc -l`

re='^[0-9]+$'
if ! [[ $UPDATES =~ $re ]] ; then
   echo "Failed to check updates"; exit 0
fi

if (( $UPDATES > 0 ));then
  echo "<span color=\"yellow\">${UPDATES}</span>"; exit 0
else
  echo "<span color=\"green\"></span>"; exit 0
fi
