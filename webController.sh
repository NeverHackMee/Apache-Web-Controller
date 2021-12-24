#!/bin/bash
WEBS=("https://www.yourweb1.es" 
      "https://www.yourweb2.es")

for str in ${WEBS[@]}; do
  HTTP_STATUS="$(curl -I $str 2>&1 | awk '/HTTP\// {print $2}')";
    if  [[ $HTTP_STATUS != "200" ]];
     then
          echo "NO activo, reiniciando";
          service apache2 restart;
          exit 1;
    fi
done
