############################################################
# Dockerfile to build Nginx Server For Jobo's WanderlustBlog
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM centos

# File Author / Maintainer
MAINTAINER Bugi Goertz

# Update the repository
RUN yum -y update

# Install necessary packages
RUN yum install -y fetchmail procmail sudo

ADD mailfetcher /mailfetcher
RUN adduser -d /data mailfetcher

RUN chown -R mailfetcher:mailfetcher /data 

CMD chown -R mailfetcher:mailfetcher /data && \
	source /data/.bashrc && \
	cd /mailfetcher && \
	/mailfetcher/setup.sh && \
	chmod 700 /data/.fetchmailrc && \
	sudo -u mailfetcher fetchmail 
