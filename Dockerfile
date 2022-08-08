FROM ubuntu:20.04
LABEL version="Velociraptor v0.6.4"
LABEL description="Velociraptor server in a Docker container"

RUN mkdir -p /opt/velociraptor && \
    for i in linux mac windows; do mkdir -p /opt/velociraptor/$i; done
COPY ./entrypoint /opt/velociraptor/entrypoint
RUN chmod +x /opt/velociraptor/entrypoint

COPY ./binaries/velociraptor-v0.6.5-2-windows-amd64.exe /opt/velociraptor/windows/velociraptor_client.exe
COPY ./binaries/velociraptor-v0.6.5-2-windows-amd64.msi /opt/velociraptor/windows/velociraptor_client.msi
COPY ./binaries/velociraptor-v0.6.5-2-linux-amd64 /opt/velociraptor/linux/velociraptor
COPY ./binaries/velociraptor-v0.6.5-2-darwin-amd64 /opt/velociraptor/mac/velociraptor_client

WORKDIR /opt/velociraptor
CMD ["./entrypoint"]

