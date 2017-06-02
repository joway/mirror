role=${1:-general}

url_prefix='http://m.sh.mk/influxdata'

# wget "{$url_prefix}/package/telegraf-1.3.0-1.x86_64.rpm"
# sudo yum localinstall telegraf-1.3.0-1.x86_64.rpm
# rm telegraf-1.3.0-1.x86_64.rpm

curl "{$url_prefix}/conf/telegraf.conf" | sed s/role = "general"/role = $role/
