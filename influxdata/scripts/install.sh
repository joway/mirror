role=${1:-general}

url_prefix='http://m.sh.mk/influxdata'
OS_ID=`awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }'`
echo "os is $OS_ID"

case $OS_ID in
amzn)
	wget "$url_prefix/package/telegraf-1.3.0-1.x86_64.rpm"
	sudo yum localinstall telegraf-1.3.0-1.x86_64.rpm
	rm telegraf-1.3.0-1.x86_64.rpm
    ;;
ubuntu)
	wget "$url_prefix/package/telegraf-1.3.0-1_amd64.deb"
	sudo dpkg -i telegraf_1.3.0-1_amd64.deb
	rm telegraf_1.3.0-1_amd64.deb
    ;;
*)
	ehco "your os not support"
    exit -1
	;;
esac

curl "{$url_prefix}/conf/telegraf.conf" | sed s/'role = "general"'/"role = "\"${role}\"""/ > /etc/telegraf/telegraf.conf
