FROM quay.io/eduk8s/base-environment:master

COPY --chown=1001:0 . /home/eduk8s/

RUN mv /home/eduk8s/workshop /opt/workshop

RUN fix-permissions /home/eduk8s

##########
USER root

#RUN sudo snap install skaffold
RUN HOME=/root && \
        sudo snap refresh skaffold

USER 1001

