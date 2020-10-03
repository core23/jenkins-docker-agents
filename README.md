Jenkins Agents
==============

[![Continuous Integration](https://github.com/core23/jenkins-docker-agents/workflows/Continuous%20Integration/badge.svg)](https://github.com/core23/jenkins-docker-agents/actions)

PHP Agents
----------

If you have a jenkins server running (on serverhost:8080), you can connect the agent via the following command.

```bash
docker run -d --restart always -v ~/.composer:/home/jenkins/.composer core23/jenkins-php-agent:7.3 -url http://serverhost:8080 SECRET AGENT_NAME
```

FAQ
---

### How can I run the images on my synology NAS?

There are some problems, if you want to run the images on a synology nas.
A working solution can be accomplished by ssh'ing to the nas and execute the following commands:

```bash
sudo su -

docker run -d --restart always -v /volume1/docker/jenkins-php-agent:/home/jenkins/.composer --name jenkins-php-agent core23/jenkins-php-agent -url http://serverhost:8080 SECRET AGENT_NAME
```
