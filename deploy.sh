#!/bin/bash

echo "开始部署 Gemini Docker 服务..."

docker compose down
docker compose build --no-cache
docker compose up -d

echo "部署完成！"
echo "健康检查: curl http://localhost:8001/health"
echo "查看日志: docker compose logs -f"
echo "停止服务: docker compose down"
