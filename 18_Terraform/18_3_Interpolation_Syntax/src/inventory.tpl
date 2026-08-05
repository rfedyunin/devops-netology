[webservers]
%{ for idx, ip in webservers ~}
${web_names[idx]} ansible_host=${ip} fqdn=${web_fqdns[idx]}
%{ endfor ~}

[databases]
%{ for idx, ip in databases ~}
${db_names[idx]} ansible_host=${ip} fqdn=${db_fqdns[idx]}
%{ endfor ~}

[storage]
${storage_name} ansible_host=${storage} fqdn=${storage_fqdn}