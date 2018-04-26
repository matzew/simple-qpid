FROM fedora:latest

RUN dnf -y update && dnf clean all
RUN dnf install -y python-qpid qpid-cpp-server qpid-tools && dnf clean all

ADD . /.qpidd

WORKDIR /.qpidd

EXPOSE 5672

ENTRYPOINT ["qpidd", "-t", "--auth=no"]

