Jenkins Agents
==============

[![Continuous Integration](https://github.com/core23/jenkins-docker-agents/actions/workflows/continuous-integration.yml/badge.svg)](https://github.com/core23/jenkins-docker-agents/actions/workflows/continuous-integration.yml)

PHP Agents
----------

If you have a jenkins server running (on serverhost:8080), you can connect the agent via the following command.

```bash
docker run -d --restart always -v ~/.composer:/home/jenkins/.composer ghcr.io/core23/jenkins-php-agent:8.2 -url http://serverhost:8080 SECRET AGENT_NAME
```

Please have a look at the [official docs](https://hub.docker.com/r/jenkins/inbound-agent) for more information.
