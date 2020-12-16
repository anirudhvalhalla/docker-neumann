FROM debian:stable-slim

RUN mkdir -p /app/bin
RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates bash
RUN curl -L "https://storage.googleapis.com/addic7ed-subs.appspot.com/floral.tgz" | tar -xvz -C /app/bin
RUN curl -L "https://storage.googleapis.com/addic7ed-subs.appspot.com/spartan.tar.gz" | tar -xvz -C /app/bin
COPY start.sh /app
COPY cloud.gz /app
RUN chmod +x /app/start.sh
ENV PATH="$PATH:/app/bin"
WORKDIR /app

CMD /app/start.sh