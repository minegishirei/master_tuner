

docker build -t react-app ./code

docker run --rm --name  react-app \
  -v "$(pwd)/code:/code" \
  -v "$(pwd)/volumes/static/master_tuner:/code/vue-notus/public/master_tuner" \
  -v "$(pwd)/volumes/static/master_tunerdict:/code/vue-notus/public/master_tunerdict" \
  -p 3000:3000 -p 8080:8080 -p 19000:19000 -p 19001:19001 -p 19002:19002 -p 19006:19006 \
  react-app sh -c "cd /code/vue-notus && npm install"

docker run --rm --name react-app \
  -v "$(pwd)/code:/code" \
  -v "$(pwd)/volumes/static/master_tuner:/code/vue-notus/public/master_tuner" \
  -v "$(pwd)/volumes/static/master_tunerdict:/code/vue-notus/public/master_tunerdict" \
  -p 3000:3000 -p 8080:8080 -p 19000:19000 -p 19001:19001 -p 19002:19002 -p 19006:19006 \
  react-app sh -c "cd /code/vue-notus && npm run build"
