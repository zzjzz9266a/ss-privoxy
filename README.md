# ss-privoxy
### Usage
* run a container;  
* define environment variables such as `server address`、`server port`、`method`、`password`, `proxy port`;  
* map the container's proxy port to the host. 

```
docker run -d --name ss-privoxy -p 8118:8118  \
  -e "SERVER_ADDR={YOUR SERVER}" \
  -e "METHOD=aes-256-cfb" \
  -e "PASSWORD={YOUR PASSWORD}" \
  -e "SSPORT={SERVER PORT}" \
  -e "PROXYPORT=8118" zzjzz9266a/ss-privoxy
```
