# first login with docker! docker login --username=.... --password=...
docker login
docker build -t rickvm/php-ci:latest .
docker push rickvm/php-ci:latest