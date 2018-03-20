FROM illallangi/ansible:latest
ENV TAUTULLI_VERSION=v2.0.22
ENV TAUTULLI_SHA256=19adaf2c4565380af46c79507aa436f9fe2b23c9e092f655437bd1a8d2536a0a
COPY image/* /etc/ansible.d/image/
RUN /usr/local/bin/ansible-runner.sh image

ENV UID=1024
ENV USER=tautulli
COPY container/* /etc/ansible.d/container/
CMD ["/usr/local/bin/tautulli-entrypoint.sh"]
