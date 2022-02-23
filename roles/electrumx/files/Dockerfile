FROM ubuntu:22.04
WORKDIR /root/

# Install & Update
RUN apt update -y \
 && apt upgrade -y \
 && apt install -y git \
 && DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata \
 && apt install -y software-properties-common \
 && add-apt-repository ppa:deadsnakes/ppa \
 && apt install -y python3 python3-aiohttp python3-pip net-tools \
 && pip3 install pylru \
 && pip3 install plyvel \
 && pip3 install 'aiorpcx==0.5.6'

# Elextrum Server
RUN git clone https://github.com/garlicoin-project/electrumx.git
ADD coins.py /root/electrumx/lib/coins.py
RUN cd /root/electrumx && python3 setup.py install

# Statups
ADD startup.sh /root/startup.sh
RUN chmod +x /root/startup.sh

# Entry
CMD /root/startup.sh
