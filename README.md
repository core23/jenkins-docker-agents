Jenkins Agents
==============

[![Build Status](http://img.shields.io/travis/core23/jenkins-docker-agents.svg)](https://travis-ci.org/core23/jenkins-docker-agents-php)

PHP Agents
----------

If you have a jenkins server running (on 127.0.0.1:8080), you can connect the agent via the following command.

```
docker run -d --rm -v ~/.composer:/home/jenkins/.composer core23/jenkins-php-agent:7.3 -url http://127.0.0.1:8080 SECRET AGENT_NAME
```

