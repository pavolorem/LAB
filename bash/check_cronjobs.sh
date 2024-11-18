## check cronjob for all users

#!/bin/bash
for user in $(cut -f1 -d: /etc/passwd); do crontab -u $user -l; done
