# syntax=docker/dockerfile:1.4
FROM --platform=$BUILDPLATFORM php:8.3.10-cli-alpine AS base

ARG VERSION

RUN <<EOT sh -ex
  curl -f -o /usr/bin/php-cs-fixer -LO "https://github.com/PHP-CS-Fixer/PHP-CS-Fixer/releases/download/v${VERSION}/php-cs-fixer.phar"
  chmod +x /usr/bin/php-cs-fixer
EOT

ENTRYPOINT ["/usr/bin/php-cs-fixer"]
CMD []
