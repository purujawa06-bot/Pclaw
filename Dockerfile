FROM sipeed/picoclaw:latest

# Reset ENTRYPOINT bawaan image agar tidak bentrok dengan CMD kita
ENTRYPOINT []

# Mengatur host agar listen di semua interface network
ENV PICOCLAW_GATEWAY_HOST=0.0.0.0

# Beberapa aplikasi Go/Node otomatis membaca port dari env PORT
ENV PORT=3000

# Sediakan folder config sesuai dokumentasi
RUN mkdir -p /root/.picoclaw/ && mkdir -p /app/docker/data/

# Salin konfigurasi yang kamu buat ke lokasi aplikasi
COPY config.json /root/.picoclaw/config.json
COPY config.json /app/docker/data/config.json

# Ekspos port 3000
EXPOSE 3000

# Menjalankan launcher secara langsung tanpa menumpuk command gateway bawaan
CMD ["picoclaw", "launcher", "--host", "0.0.0.0"]
