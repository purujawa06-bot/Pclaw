# Menggunakan base image resmi picoclaw (asumsi image name sesuai convention repo sipeed/picoclaw)
FROM sipeed/picoclaw:latest

# Set environment agar mendengarkan di semua network interface (0.0.0.0)
ENV PICOCLAW_GATEWAY_HOST=0.0.0.0
# Jika launcher/gateway mendukung custom port via env, kita set ke 3000
ENV PORT=3000
ENV PICOCLAW_LAUNCHER_PORT=3000

# Buat direktori konfigurasi sesuai dokumentasi
RUN mkdir -p /root/.picoclaw/ && mkdir -p /app/docker/data/

# Salin config.json yang sudah kita buat ke lokasi pembacaan aplikasi
# Menyalin ke kedua tempat (Gateway mode & Quick start mode) agar aman
COPY config.json /root/.picoclaw/config.json
COPY config.json /app/docker/data/config.json

# Expose port 3000 sesuai request
EXPOSE 3000

# Jalankan aplikasi dengan profile launcher (Web Console) sebagai default entrypoint
# Menggunakan sh -c untuk fleksibilitas jika dijalankan di environment cloud
CMD ["picoclaw", "launcher", "--host", "0.0.0.0", "--port", "3000"]
