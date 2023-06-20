FROM alpine:3.10

WORKDIR /usr/public/

# Prepare static files
RUN echo "<h1>Test</h1>" > index.html

# Install gcloud cli
RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz
RUN mkdir -p /usr/local/gcloud \
  && tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz \
  && /usr/local/gcloud/google-cloud-sdk/install.sh
ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin

# Copy the deploy script
COPY ./deploy.sh /run/

# The default entrypoint is a shell
ENTRYPOINT ["/bin/sh"]
