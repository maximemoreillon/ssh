FROM ubuntu:24.10

# Install OpenSSH Server
RUN apt-get update && \
  apt-get install -y openssh-server && \
  apt-get clean

# Connfigure the OpenSSH server
RUN echo "PasswordAuthentication no" >> /etc/ssh/sshd_config && \
  echo "ChallengeResponseAuthentication no" >> /etc/ssh/sshd_config && \
  echo "UsePAM no" >> /etc/ssh/sshd_config && \
  echo "GatewayPorts yes" >> /etc/ssh/sshd_config 
    
EXPOSE 22
EXPOSE 2222
EXPOSE 1080

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
