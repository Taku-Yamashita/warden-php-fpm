ARG PHP_VERSION
FROM quay.io/warden/php-fpm:${PHP_VERSION}-magento2
LABEL org.opencontainers.image.source=https://github.com/taku-yamashita/warden-php-fpm

RUN composer global require mage2tv/magento-cache-clean
RUN curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo && \
    sudo yum install yarn make -y && \
    yarn global add magepack

RUN echo -e "\n\
alias mc='\$HOME/.composer/vendor/bin/cache-clean.js -w'\n\
alias m2='php /var/www/html/bin/magento'\n\
alias m2cc='m2 cache:clean'\n\
alias m2su='m2 setup:upgrade'\n\
alias m2ssd='m2 setup:statit-content:deploy'\n\
alias m2ms='m2 module:status'\n\
alias m2ccc='m2 cache:clean layout block_html full_page'\n\
gruntw(){\n\
 grunt exec:\$1 && grunt less:\$1 && grunt watch\n\
}\n\
" >> ~/.bashrc

ENV PATH $PATH:~/.yarn/bin
