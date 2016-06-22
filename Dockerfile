FROM resin/rpi-raspbian:jessie
MAINTAINER Martin Dilger <martin@effectivetrainings.de>
ENV INFLUX_HOME=/influxdb
RUN mkdir $INFLUX_HOME
RUN apt-get update && \
    apt-get install -y wget
WORKDIR $INFLUX_HOME
RUN wget --no-check-certificate https://dl.influxdata.com/influxdb/releases/influxdb-1.0.0~rc2_linux_armhf.tar.gz && \
    tar xvfz influxdb-1.0.0~rc2_linux_armhf.tar.gz
WORKDIR ./influxdb-1.0.0~rc2-1/
EXPOSE 8083 
EXPOSE 8086
ENTRYPOINT ["usr/bin/influxd"]
