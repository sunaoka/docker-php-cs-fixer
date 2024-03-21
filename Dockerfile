FROM --platform=$BUILDPLATFORM php:8.3.4-cli-alpine AS base

ARG VERSION

RUN curl -f -o /usr/bin/php-cs-fixer -LO "https://github.com/PHP-CS-Fixer/PHP-CS-Fixer/releases/download/v${VERSION}/php-cs-fixer.phar" \
 && chmod +x /usr/bin/php-cs-fixer

ENTRYPOINT ["/usr/bin/php-cs-fixer"]
CMD []
