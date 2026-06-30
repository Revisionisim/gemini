FROM denoland/deno:1.45.5

WORKDIR /app

COPY . .

RUN deno cache src/deno_index.ts

EXPOSE 8000

CMD ["deno", "run", "--allow-net", "--allow-read", "--allow-env", "src/deno_index.ts"]
