##  script for signing csr on pki_docker_ca and export crt certs ##
#!/bin/sh

# move to folder where is easy_rsa #
cd /usr/share/easy-rsa/ && \

# move csr file for signing #
mv /home/ansible/*.csr . && \

# import csr request #
./easyrsa import-req $(echo $(ls -lah *.csr) | awk '{print ($9)}') $(echo $(ls -lah *.csr) | awk '{print ($9)}' | sed 's/\..*//') && \

# sign csr #
./easyrsa sign-req server $(echo $(ls -lah *.csr) | awk '{print ($9)}' | sed 's/\..*//') $(echo y) 

# remove csr after signing #
rm -f /usr/share/easy-rsa/*.csr && \

# copy issue crt #
cp $(find /usr/share/easy-rsa/pki/issued/ -type f -mmin -20) /home/ansible && \

# change mode and owner #
chown ansible:ansible /home/ansible/*.crt && chmod 0644 /home/ansible/*.crt

# clean history #
cat /dev/null > ~/.bash_history && history -c && unset HISTFILE
