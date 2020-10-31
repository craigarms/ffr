FROM frrouting/frr

# Remove infinte Tail from Docker start & present prompt
RUN sed -i '$ d' /usr/lib/frr/docker-start
COPY startup.sh /startup.sh
RUN echo '/gns3/bin/busybox sh -c /startup.sh' >> /usr/lib/frr/docker-start
# RUN echo '/bin/ash -c while true; do /bin/sh; done' >> /usr/lib/frr/docker-start
# RUN echo '/gns3/bin/busybox script -qfc while true; do /gns3/bin/busybox sh; done /dev/null'  >> /usr/lib/frr/docker-start
RUN chmod +x /startup.sh
