FROM amazonlinux
RUN yum update -y  && yum install -y unzip
RUN curl -o daemon.zip https://s3.us-east-2.amazonaws.com/aws-xray-assets.us-east-2/xray-daemon/aws-xray-daemon-linux-3.x.zip
RUN unzip daemon.zip && cp xray /usr/bin/xray
COPY Xray-daemon.yaml /
ENTRYPOINT ["/usr/bin/xray", "-c", "/Xray-daemon.yaml"]
EXPOSE 2000/udp
EXPOSE 2000/tcp
