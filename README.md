# mintel-elk
Mintel interview technical challenge

# About
Docker deployment based on https://github.com/deviantony/docker-elk

Instead of forking the above repo, I used it as a template. This allowed me a better understanding of how it works. If this was a project at work and not an interview assignment, I would probably just fork the repo to save time.

This was my first time creating and using an ELK stack; it was a good learning experience.

# Requirements

docker

docker-compose

netcat

# Usage

First we need to start up the ELK stack and populate with the log file. Choose the correct script based on your netcat distribution.

If you are using BSD netcat (Debian, Ubuntu, MacOS system, ...)

`bash runBSD.sh`

Else, you are using GNU netcat (CentOS, Fedora, MacOS Homebrew, ...)

`bash runGNU.sh`

These scripts take a little over 2 minutes to run, in order to allow the ELK stack time to start up before sending the log file to logstash.

Once the script completes, access Kibana by opening your browser and going to:

`localhost:5601`

User: `elastic`
Pass: `changeme` (Putting plaintext passwords in a repo is a bad idea! But this is a prototype not meant to hold real data :))

Import the dashboard by navigating to **Management** -> **Stack Management** -> **Kibana** -> **Saved Objects** -> **Import**

Import the `mintel-dashboard.ndjson` file found in this repo's `json` directory

View the dashboard by selecting it in the **Saved Objects** page or navigating to **Analytics** -> **Dashboard**

Once you are all finished, destroy and cleanup the stack with this script:

`bash cleanup.sh`

All done!

# Design

*Why 2 separate scripts for GNU and BSD netcat?*

The two distributions use different flags for this operation. Instead of creating one script that differentiates based on OS, it was simpler for this prototype to create 2 separate scripts.

*Why docker-compose vs. docker?*

Docker-compose is used because the 3 docker components are all logically connected. The other option was a script running 3 separate docker deployments. Also https://github.com/deviantony/docker-elk works for this use case and is implemented with docker-compose. No need to reinvent the wheel :)

*Why donut, heatmap, and table visualizations?*

These seemed the best options to me for the 3 requested queries. This was my first time using Kibana, and with some more time I think that I could have made the visualizations more complete and nicer looking. But I'm happy with this as a prototype.