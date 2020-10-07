Create `PROJECT_ROOT/.warden/warden-env.yml`
```
version: "3.5"
services:
  php-fpm:
    image: ghcr.io/taku-yamashita/warden-php-fpm:${VERSION}
```

Extended image from warden php-fpm

- yarn
- Magepack
- mage2tv/magento-cache-clean
- Alias
- Grunt


## image repo
- ghcr.io/taku-yamashita/warden-php-fpm
- ytaku/warden-php-fpm