#!/bin/bash
# filepath: /Users/minegishirei/myworking/master_tuner/release.sh

set -e

# Docker ボリュームとポートのマッピング設定
VOLUMES="-v \"$(pwd)/code:/code\" \
-v \"$(pwd)/volumes/static/master_tuner:/code/vue-notus/public/master_tuner\" \
-v \"$(pwd)/volumes/static/master_tunerdict:/code/vue-notus/public/master_tunerdict\""
PORTS="-p 3000:3000 -p 8080:8080 -p 19000:19000 -p 19001:19001 -p 19002:19002 -p 19006:19006"

# Docker イメージのビルド
docker build -t react-app ./code

# npm install の実行
docker run --rm ${VOLUMES} ${PORTS} react-app sh -c "cd /code/vue-notus && npm install"

# アプリケーションのビルド
docker run --rm ${VOLUMES} ${PORTS} react-app sh -c "cd /code/vue-notus && npm run build"

# アプリケーションの起動
docker run --rm ${VOLUMES} ${PORTS} react-app sh -c "cd /code/vue-notus && npm run serve"
