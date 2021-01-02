FROM bitnami/minideb:latest

ENV LICENCE=####################

RUN apt-get update && apt-get install -y --no-install-recommends wget && \
wget --no-check-certificate -O nessus.deb \
https://www.tenable.com/downloads/api/v1/public/pages/nessus/downloads/12207/download?i_agree_to_tenable_license_agreement=true && \
dpkg -i nessus.deb && \
rm nessus.deb

EXPOSE 8834

ENTRYPOINT ["/opt/nessus/sbin/nessusd"]

VOLUME ["/opt/nessus/etc/nessus/"]
