FROM komljen/ubuntu
ENV USER root
ENV PASS aiPeekai0AeZ2meephoolais7doo1thu
RUN \
  apt-get update && \
  apt-get -y install \
          mysql-server-5.5 && \
  rm -rf /var/lib/apt/lists/*

COPY my.cnf /etc/mysql/my.cnf
COPY main.sh main.sh
VOLUME ["/var/lib/mysql"]
RUN rm /usr/sbin/policy-rc.d
CMD ["/main.sh"]
EXPOSE 3306
