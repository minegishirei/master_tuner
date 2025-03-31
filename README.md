
# tuner

- psy_dashboard : https://minegishirei.github.io/master_tuner/code/vue-notus/dist/index2.html


# デプロイ方法

## build & release

```sh
docker-compose run react-app sh -c "cd /code/vue-notus && npm run build" && git add . && git commit -m "push" && git push
```

## start

```sh
docker-compose run react-app sh -c "cd /code/vue-notus && npm install"
docker-compose up
```
