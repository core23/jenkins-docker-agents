Jenkins Agents
==============

[![Build Status](http://img.shields.io/travis/core23/jenkins-docker-agents.svg)](https://travis-ci.org/core23/jenkins-docker-agents-php)

PHP Agents
----------

If you have a jenkins server running (on serverhost:8080), you can connect the agent via the following command.

```bash
docker run -d --restart always -v ~/.composer:/home/jenkins/.composer core23/jenkins-php-agent:7.3 -url http://serverhost:8080 SECRET AGENT_NAME
```

