
## CAPROVER FAST GUIDE FOR Remote server

Read more on: https://caprover.com/docs/get-started.html
Troubleshoots: https://caprover.com/docs/troubleshooting.html

1. Setup a remote server and attach Static Public IP to it.
2. Enable inbound ports 443 and 80 for all IPs.
3. Run docker container. 
   Troubleshoots:
      - You can use env BY_PASS_PROXY_CHECK='TRUE' to skip proxy validation
      - Provide Public ip to container via env MAIN_NODE_IP_ADDRESS='remote-server-public-ip'
4. Connect route domain. 
    - TYPE: A record
    - HOST: *.something
    - POINTS TO: (IP address of remote server)
    - TTL: (doesn't matter)
5. Install Caprover CLI in your remote server
´´´
npm install -g caprover
´´´
6. Setup caprover
```
caprover serversetup

OBS! In Question 2 you need to pass in Internal IP of remote server
```

7. DONE AND DONE. Go to the captain rover route you got and enter with the password you provided.


