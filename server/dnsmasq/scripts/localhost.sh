#!/usr/bin/env sh

DEV=(wlp enp eth)
LOCAL_DOMAIN=${LOCAL_DOMAIN_NAME:-}
CONFIG_FILENAME="local.conf"
HOSTS_FILENAME="hosts.local.domain"

if [[ -z "${LOCAL_DOMAIN}" ]]; then
    echo "WARNING: LOCAL_DOMAIN is empty." 1>&2
fi

DEVICES=()
for d in ${DEV[@]} ; do
    DEVICES+=($(ip link  | grep " ${d}" | awk -F ": " '{print $2}'))
done

ADDRESSES=()
for d in ${DEVICES[@]} ; do
    ADDRESSES+=($(ip addr show ${d} | grep -Eo 'inet ([0-9.]+)' | sed -e 's:inet ::g'))
done


if [[ -n "${LOCAL_DOMAIN}" ]]; then

    echo "address=/.${LOCAL_DOMAIN}/" >> /etc/dnsmasq.d/${CONFIG_FILENAME}

    #echo "" > /etc/dnsmasq.d/${HOSTS_FILENAME}
    #for addr in ${ADDRESSES[@]} ; do
        #echo "${addr}   ${LOCAL_DOMAIN}" >> /etc/dnsmasq.d/${HOSTS_FILENAME}
        #echo "${addr}   .${LOCAL_DOMAIN}" >> /etc/dnsmasq.d/${HOSTS_FILENAME}
    #done

    echo "addn-hosts=/etc/dnsmasq.d/${HOSTS_FILENAME}" > /etc/dnsmasq.d/${CONFIG_FILENAME}
    if [[ -n "${LOCAL_DOMAIN}" ]]; then
        for addr in ${ADDRESSES[@]} ; do
            echo "address=/.${LOCAL_DOMAIN}/${addr}" >> /etc/dnsmasq.d/${CONFIG_FILENAME}
        done
        ##echo "cname=%.${LOCAL_DOMAIN},${LOCAL_DOMAIN}" >> /etc/dnsmasq.d/${CONFIG_FILENAME}
        ##echo "domain=${LOCAL_DOMAIN}" >> /etc/dnsmasq.d/${CONFIG_FILENAME}
        ##echo "local=/${LOCAL_DOMAIN}/" >> /etc/dnsmasq.d/${CONFIG_FILENAME}
    fi
fi

echo "*** config file:"
cat /etc/dnsmasq.d/${CONFIG_FILENAME}
echo "********************"

echo "*** host file:"
cat /etc/dnsmasq.d/${HOSTS_FILENAME}
echo "********************"
