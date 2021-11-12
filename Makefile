.PHONY: all
all: php-7.4 php-8.0 php-8.1

.PHONY: php-7.4
php-7.4:
	docker build --no-cache -t core23/jenkins-php-agent:7.4 php/7.4

.PHONY: php-8.0
php-8.0:
	docker build --no-cache -t core23/jenkins-php-agent:8.0 php/8.0

.PHONY: php-8.1
php-8.1:
	docker build --no-cache -t core23/jenkins-php-agent:8.1 php/8.1
