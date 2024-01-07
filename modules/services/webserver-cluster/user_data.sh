#!/bin/bash
cat >> index.html <<EOF
<h1>${server_startup_text}</h1>
<p>database address: ${database_address}</p>
<p>database port: ${database_port}</p>
EOF

nohup busybox httpd -f -p ${server_port} &