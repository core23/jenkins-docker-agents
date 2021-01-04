.PHONY: all
all: php-7.1 php-7.2 php-7.3 php-7.4

.PHONY: php-7.1
php-7.1:
	docker build --no-cache -t core23/jenkins-php-agent:7.1 php/7.1

.PHONY: php-7.2
php-7.2:
	docker build --no-cache -t core23/jenkins-php-agent:7.2 php/7.2

.PHONY: php-7.3
php-7.3:
	docker build --no-cache -t core23/jenkins-php-agent:7.3 php/7.3

.PHONY: php-7.4
php-7.4:
	docker build --no-cache -t core23/jenkins-php-agent:7.4 php/7.4

.PHONY: php-8.0
php-8.0:
	docker build --no-cache -t core23/jenkins-php-agent:8.0 php/8.0
