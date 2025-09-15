DNS1="${DNS1:-1.1.1.1}"
DNS2="${DNS2:-8.8.8.8}"
export DNS1 DNS2

mkdir -p /3proxy/conf
envsubst < /app/proxy_env.cfg > /3proxy/conf/3proxy.cfg

exec /3proxy/bin/3proxy /3proxy/conf/3proxy.cfg