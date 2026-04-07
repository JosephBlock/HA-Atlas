ARG BUILD_FROM
# Use jamesits/ripe-atlas as the base image.
# BUILD_FROM is passed by the HA Supervisor but intentionally unused here
# because we rely on the upstream probe image for the full probe runtime.
FROM jamesits/ripe-atlas:5120

# Copy the HA startup shim
COPY run.sh /run.sh
RUN chmod a+x /run.sh

ENTRYPOINT []
CMD ["/run.sh"]
