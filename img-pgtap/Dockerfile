FROM postgres:17

RUN apt-get update && apt-get install -y --no-install-recommends \
    make patch \
    curl ca-certificates unzip \
    && rm -rf /var/lib/apt/lists/*

ENV PGTAP_VER 1.3.3
RUN curl -fOL https://github.com/theory/pgtap/releases/download/v$PGTAP_VER/pgTAP-$PGTAP_VER.zip \
  && unzip pgTAP-$PGTAP_VER \
  && cd pgTAP-$PGTAP_VER \
  && USE_PGXS=1 make \
  && make install \
  && cd .. && rm -rf pgTAP-*
