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