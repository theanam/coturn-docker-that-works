#!/bin/sh
echo "Creating Fresh TURN config file...."
CONF=/etc/coturn/turnserver.conf
echo "Using conf file: ${CONF}" &&\
# Remove the config file if it already exists
rm -f ${CONF}
# Generate a fresh config file
echo "listening-port=${TURN_PORT}" >> ${CONF}
echo "min-port=${TURN_MIN_PORT}" >> ${CONF}
echo "max-port=${TURN_MAX_PORT}" >> ${CONF}
echo "realm=${TURN_REALM}" >> ${CONF}
echo "user=${TURN_USER}:${TURN_PASSWORD}">> ${CONF}
echo "total-quota=${TURN_QUOTA}" >> ${CONF} 
echo "cert=/opt/turn.crt" >> ${CONF}
echo "pkey=/opt/turn.key" >> ${CONF}
turnadmin -A -u ${TURN_USER} -p ${TURN_PASSWORD}
echo "Config File Creates Successfully..."
# Run the turn server
turnserver