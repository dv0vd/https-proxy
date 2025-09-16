# Simple HTTPS proxy server
To run a HTTPS proxy server, execute the following command:
```
podman run -d --name https-proxy -p 60000:1080 --restart unless-stopped --memory=128M --cpus=0.25 docker.io/dv0vd/https-proxy
```
If you encounter IPv6 errors, you will need to create a custom network with IPv6 support:
```
podman network create --ipv6 podman_network
```
Then, specify the network in the `podman run` command:
```
podman run -d --name https-proxy --network podman_network -p 60000:1080 --restart unless-stopped --memory=128M --cpus=0.25 docker.io/dv0vd/https-proxy
```
You can specify two custom DNS servers by setting the environment variables DNS1 and DNS2. By default, DNS1 is set to **1.1.1.1** and DNS2 is set to **8.8.8.8**.
```
podman run -d --name https-proxy --network podman_network -e DNS1=1.1.1.1 -e DNS2=8.8.8.8 -p 60000:1080 --restart unless-stopped --memory=128M --cpus=0.25 docker.io/dv0vd/https-proxy
```