FROM alpine:3.10

WORKDIR /usr/public/

# Prepare static files
RUN echo "<h1>Test</h1>" > index.html

RUN apk --no-cache add curl

RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python

# Install gcloud cli
RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz
RUN mkdir -p /usr/local/gcloud
RUN tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz
RUN /usr/local/gcloud/google-cloud-sdk/install.sh
ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin

# Copy the deploy script
COPY ./deploy.sh /run/

RUN chmod a+x /run/deploy.sh

# The default entrypoint is a shell
ENTRYPOINT ["/bin/sh"]
