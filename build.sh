LIST=("7.1" "7.2" "7.3" "7.4")
for v in "${LIST[@]}"
do
    echo "building version: ${v}"
    docker build --build-arg PHP_VERSION=${v} -t warden/php-fpm:${v} .
done