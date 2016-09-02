# Sencha Env - an environment built on the node-env image that includes
# Sencha CMD 6.1.3
FROM danielmaple/node-env:latest
MAINTAINER Daniel Maple <danielm@ibcos.co.uk>

## Install sencha cmd
# Download the compressed sencha cmd archive
RUN curl -o /tmp/sencha-cmd.run.zip http://cdn.sencha.com/cmd/6.1.3/no-jre/SenchaCmd-6.1.3-linux-amd64.sh.zip && \
    # Extract the archive
    unzip -p /tmp/sencha-cmd.run.zip > /tmp/sencha-cmd.run && \
    # Grant execution permissions to extracted file
    chmod +x /tmp/sencha-cmd.run && \
    # Run the sencha cmd installer silently
    /tmp/sencha-cmd.run -q && \
    # Remove temporary files
    rm /tmp/sencha-cmd.run.zip /tmp/sencha-cmd.run

# Add sencha to PATH
ENV PATH /root/bin/Sencha/Cmd/6.1.3.42:$PATH
