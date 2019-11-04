FROM hshttsr/android28-alpine


ENV GRADLE_VERSION=28.0.3


## install npm package
RUN apk update && \
    apk upgrade && \
    apk --no-cache --virtual .build add --update \
    npm

RUN npm install -g cordova



#Install gradle

RUN cd /usr/lib \
&& wget https://downloads.gradle.org/distributions/gradle-5.6.1-bin.zip -o   gradle-bin.zip \
&& unzip "gradle-5.6.1-bin.zip" \
&& ln -s "/usr/lib/gradle-5.6.1/bin/gradle" /usr/bin/gradle \
&& rm "gradle-bin.zip"


WORLDIR /home/work

#Env set up
ENV GRADLE_HOME=/usr/bin/gradle

#ENV PATH=$PATH:$GRADLE_HOME/bin:$PATH
ENV PATH=$PATH:$GRADLE_HOME/bin 
#JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64