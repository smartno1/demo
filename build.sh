#!/bin/bash

$ sudo chmod 777 /usr/local/tomcat/webapp/demo/gradlew

$ /usr/local/tomcat/webapp/demo/gradlew build

$ sudo mv /usr/local/tomcat/webapp/demo/build/lib/*.war /usr/local/tomcat/webapp/demo/build/lib/ROOT.war

$ cp /usr/local/tomcat/webapp/demo/build/lib/ROOT.war /usr/local/tomcat/webapp/.


$ /usr/local/tomcat/bin/shutdown.sh
$ /usr/local/tomcat/bin/startup.sh
