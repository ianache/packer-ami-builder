#Description: Executes InSpec using an existing profile and connects
#             to the running hypervisor image before importing to aws
#!/bin/bash


inspec supermarket exec dev-sec/cis-linux-benchmark -p 2222 -t ssh://root:vagrant@127.0.0.1

exit 0
