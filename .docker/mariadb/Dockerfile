FROM mariadb:latest

#RUN useradd mysql
#RUN mkdir /var/lib/mysql
#RUN chown mysql:mysql /var/lib/mysql
COPY ./.docker/mariadb/my.cnf /etc/alternatives/my.cnf
#RUN chmod 755 /etc/alternatives/my.cnf
#RUN chown mysql:mysql /etc/alternatives/my.cnf
USER mysql:mysql