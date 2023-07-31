# Docker Image for Pentesting

<!-- index-start -->
## Index

- [Description](#description)
  - [Key Features](#key-features)
- [Instructions](#instructions)
  - [Data](#data)
  - [Steps:](#steps)
    - [Start from Docker Hub](#start-from-docker-hub)
    - [Building the Image from the Repository](#building-the-image-from-the-repository)
<!-- index-end -->

## Description
This image has been carefully designed to provide you with a complete and ready-to-use environment for your penetration testing and cybersecurity activities.

The image is based on a Kali Linux base image and comes equipped with a diverse set of tools to assist you in the pentesting process. These tools cover various aspects, from network scanning and enumeration to vulnerability analysis and exploitation.

### Key Features
- **Network Scanning**: Discover and map systems and services on the target network.
- **Enumeration and Fingerprinting**: Obtain relevant information about systems, users, and shared resources.
- **Vulnerability Analysis**: Identify potential weaknesses in evaluated systems and services.
- **Exploitation and Post-Exploitation**: Conduct exploitation tests based on known vulnerabilities.
- **Brute-Force Tools**: Perform brute-force attacks to test password and credential strength.
- **Traffic Capture and Analysis**: Analyze network traffic to identify vulnerabilities and suspicious behavior.
- **Sniffing and Spoofing**: Monitor network traffic and manipulate packets for specific tests.
- **Social Engineering Tools**: Conduct social engineering tests and raise awareness about potential risks.
- **Forensic Analysis**: Analyze compromised systems and collect digital evidence.
- **Custom Scripts and Libraries**: Includes additional resources to facilitate testing and automate common tasks.

Remember that the use of these tools must always be ethical and legal. Make sure to obtain proper consent before testing systems that do not belong to you. This Docker image has been configured to provide a secure and isolated environment, allowing you to focus on your pentesting activities responsibly and professionally.

It is important to note that the image will be continuously updated, including new tools. It is recommended to always use the latest version of the repository to ensure you have the latest improvements and functionalities.

Enjoy exploring the world of cybersecurity and enhancing your skills with our Pentesting image! 🔒🔍🛡️

Note: The image also includes an RDP server and an SSH server, allowing connections both through the console and the graphical interface. The SSH server is configured to work only with public key authentication.

## Instructions

### Data
    Root Password: wi03Ho9RpG3s4iFWrcHrOkQLzWwrjOd0HH
    SSH: 2222
    RDP: 33909

### Steps:
The image can be started in two different ways. Each one is explained below:

#### Start from Docker Hub
##### Run the Container
To run the Docker container, use the following command:

    docker run -d -it --name kali-linux --network host ioritz1993/docker-kalilinux

If you do not want to use the same network as your host, use the following command:

    docker run -d -it --name kali-linux -p 127.0.0.1:33909:33909 -p 127.0.0.1:2222:2222 ioritz1993/docker-kalilinux

The difference between these commands lies in how they handle the network:

The first command (--network host) shares the host's network stack, so the container's services are directly available on the host's network interfaces without port mapping.

The second command (-p) explicitly maps specific container ports to corresponding host ports, allowing you to control which host ports are used to access specific services within the container. The IP address 127.0.0.1 restricts access to the container's services only from the host itself.

##### Attention!
It is important to note that ports 2222 and 33909 must be free on the host. If they are not, you will need to use other ports. For example, if you want to use port 3333 for SSH and port 4444 for RDP, use the following command:

    docker run -d -it --name kali-linux -p 127.0.0.1:4444:33909 -p 127.0.0.1:3333:2222 ioritz1993/docker-kalilinux

The IP address 127.0.0.1 can be removed, but be aware that the ports, in that case, will be accessible from outside the machine.

##### Remote Desktop Connection
To connect via remote desktop, use the following command:

    xfreerdp +clipboard /u:root /p:wi03Ho9RpG3s4iFWrcHrOkQLzWwrjOd0HH /v:localhost:33909 /size:1920x1080

In this example, xfreerdp is used as the client, but you can use any client. If you have mapped a different port, make sure to use that port in the command.

##### SSH Connection
To connect via SSH, note that only public key authentication is enabled. If you don't have a public key, you will need to generate one. You can use the following command:

    ssh-keygen

Then, send the public key to the container using the following command:

    docker cp id_rsa.pub kali-linux:/root/.ssh/authorized_keys

With the following command, we will assign the appropriate user and group to the file:

    docker exec kali-linux chown root:root /root/.ssh/authorized_keys

To make the SSH connection, use the following command:

    ssh root@localhost -p 2222

#### Building the Image from the Repository
Generate your SSH key and place it inside the config folder with the name id_rsa.pub.

Build the image with the following command:

    docker build -t docker-kalilinux .

To run the Docker container, use the following command:

    docker run -d -it --name kali-linux --network host docker-kalilinux

If you do not want to use the same network as your host, use the following command:

    docker run -d -it --name kali-linux -p 127.0.0.1:33909:33909 -p 127.0.0.1:2222:2222 docker-kalilinux

I hope this information is helpful for your pentesting activities and helps you improve your cybersecurity skills. Good luck! 🔒🔍🛡️
