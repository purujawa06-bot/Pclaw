FROM sipeed/picoclaw:latest

# Reset entrypoint bawaan
ENTRYPOINT []

# Pindahkan setting host ke Environment Variable OS (bukan di dalam JSON)
ENV PICOCLAW_GATEWAY_HOST=0.0.0.0

# Terkadang binary Go mencari port via env berikut, kita set semua ke 3000
ENV PICOCLAW_GATEWAY_PORT=3000
ENV PORT=3000
ENV PICOCLAW_PORT=3000

# Siapkan direktori konfigurasi
RUN mkdir -p /root/.picoclaw/ && mkdir -p /app/docker/data/

# Salin config.json yang sudah bersih
COPY config.json /root/.picoclaw/config.json
COPY config.json /app/docker/data/config.json

# Ekspos port 3000 untuk health check platform cloud/PaaS kamu
EXPOSE 3000

# Jalankan gateway dengan flag binding host yang valid
CMD ["picoclaw", "gateway", "--host", "0.0.0.0"]
