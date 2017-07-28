FROM drujensen/crystal:0.23.0

ENV AMBER_VERSION 0.1.17

RUN curl -L https://github.com/Amber-Crystal/amber_cmd/archive/v$AMBER_VERSION.tar.gz | tar xvz -C /usr/local/share/. && cd /usr/local/share/amber_cmd-$AMBER_VERSION && crystal deps && make

RUN ln -sf /usr/local/share/amber_cmd-$AMBER_VERSION/bin/amber /usr/local/bin/amber

WORKDIR /app/user

ADD . /app/user

RUN crystal deps

CMD ["crystal", "spec"]
