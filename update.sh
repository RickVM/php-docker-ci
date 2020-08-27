set -e
# first login with docker! docker login --username=.... --password=...
docker login

docker build -t rickvm/php-ci:7.0 --build-arg VERSION=7.0 .
docker push rickvm/php-ci:7.0

docker build -t rickvm/php-ci:7.2 --build-arg VERSION=7.2 .
docker push rickvm/php-ci:7.2

docker build -t rickvm/php-ci:7.4 --build-arg VERSION=7.4 .
docker push rickvm/php-ci:7.4
