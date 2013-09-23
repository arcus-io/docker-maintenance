#!/bin/sh
TITLE=${TITLE:-"Under Maintenance"}
MESSAGE=${MESSAGE:-"Please try again in a few moments."}

cat << EOF > /usr/share/nginx/www/index.html
<html>
  <head>
    <title>$TITLE</title>
    <style>
      body { background-color: #dedede; margin: 0; }
      h1 { padding: 280px 0 0 0; margin: 0; text-align: center; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 24px; font-weight: normal; }
      h2 { padding: 5px 0 0 0; margin: 0; text-align: center; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; color: #999; font-weight: normal; }
    </style>
  </head>
  <body>
    <center><div style="width: 530px; height: 434px; background-image: url(/img/error.png); margin: 25px auto;">
      <h1>
        $TITLE
      </h1>
      <h2>
        $MESSAGE
      </h2>
    </div></center>
  </body>
</html>
EOF

/usr/sbin/nginx -c /etc/nginx/nginx.conf
