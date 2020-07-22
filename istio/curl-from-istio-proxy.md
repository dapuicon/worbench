# curl from istio proxy

## Using mtls

```bash
k exec -it <pod_name> -c istio-proxy -- curl  --key /etc/certs/key.pem --cert /etc/certs/cert-chain.pem --cacert /etc/certs/root-cert.pem -k -v -X POST --header 'Content-Type: application/json;charset=utf-8' --header 'Accept: application/json' --header 'Authorization: Bearer 1234' -d '{"name": "dani"}' 'https://svc:80/call'  
```

