FROM ubuntu:22.04
WORKDIR /root/

# Install & Update
RUN apt update -y \
 && apt upgrade -y \
 && apt install wget -y

# Garlicoin Install
RUN wget https://github.com/GarlicoinOrg/Garlicoin/releases/download/v0.17.3/garlicoin-0.17.3-x86_64-linux-gnu.tar.gz \
 && tar -xf garlicoin-0.17.3-x86_64-linux-gnu.tar.gz \
 && mv garlicoin-0.17.3/bin/* /root/ \
 && rm -rf /root/garlicoin-0.17.3/ \
 && rm -f garlicoin-0.17.3-x86_64-linux-gnu.tar.gz

# Configuration
RUN mkdir /root/.garlicoin
ADD garlicoin.conf /root/.garlicoin/garlicoin.conf

# Statups
ADD startup.sh /root/startup.sh
RUN chmod +x /root/startup.sh

# Entry
CMD /root/startup.sh