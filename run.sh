#! /bin/sh

echo "setting up /data"
mkdir -p /data/db /data/archive /data/logs /data/incoming /data/tmp

if [ -n "$SMTP_SERVER" ]; then
	echo "configuring SSMTP to send mail to $SMTP_SERVER"
	echo "mailhub=$SMTP_SERVER" >/etc/ssmtp/ssmtp.conf
fi

exec inoticoming --foreground --initialsearch /data/incoming --suffix .changes /usr/bin/reprepro -b /data --outdir /data/archive --waitforlock 1000 processincoming default '{}' \;
