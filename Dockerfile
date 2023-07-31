FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND noninteractive
RUN echo 'root:wi03Ho9RpG3s4iFWrcHrOkQLzWwrjOd0HH' | chpasswd

RUN apt update && apt install -yqq kali-linux-large

# Update all the things, then install my personal faves
RUN apt update && apt upgrade -y && apt dist-upgrade -y && apt install -y \
    cadaver \
    cupp \
    ffuf \
    gdb \
    git \
    hashcat \
    hydra \
    iproute2 \
    iputils-ping \
    john \
    man-db \
    medusa \
    nano \
    nikto \
    nuclei \
    nmap \
    openssh-server \
    proxychains \
    python3-impacket \
    python3-pip \
    socat \
    sqlmap \
    sslscan \
    sublist3r \
    tcpdump \
    tor \
    vnstat \
    wafw00f \
    wapiti \
    wireshark \
    webshells \
    wget \
    wordlists \
    wpscan \
    zaproxy

# Install ngrok
RUN curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && \
    echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list && \
    apt update && apt install ngrok

# SSH config
RUN mkdir -p /root/.ssh && \
    rm /etc/ssh/sshd_config
COPY config/sshd_config /etc/ssh
COPY config/id_rsa.pub  /root/.ssh
RUN mv /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys

# Config RDP
RUN wget https://gitlab.com/kalilinux/recipes/kali-scripts/-/raw/main/xfce4.sh
RUN chmod +x xfce4.sh
RUN ./xfce4.sh
COPY config/xrdp.ini /etc/xrdp
RUN apt install -y dbus-x11

# Repos github
RUN cd /root && \
    mkdir REPOSITORIOS && \
    cd REPOSITORIOS && \
   z

RUN gzip -d /usr/share/wordlists/rockyou.txt.gz
RUN updatedb.plocate

# Install pip2.7
# RUN wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
# RUN python2.7 ./get-pip.py

CMD service ssh start && /etc/init.d/xrdp restart && bash
