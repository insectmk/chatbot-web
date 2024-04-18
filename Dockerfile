#FROM openjdk:8-alpine
FROM anapsix/alpine-java:8_server-jre_unlimited


#对时作用
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#目录是终端默认在此目录下
WORKDIR /test

EXPOSE 9001
#如果是到文件夹后面必须加上“/”,不然会找不到文件，./代表当前目录即是/test目录
COPY ./target/chatbot-web-0.0.1-SNAPSHOT.jar ./app/

#poi.jar包就会在根目录/test/app/poi.jar下
CMD java -jar ./app/chatbot-web-0.0.1-SNAPSHOT.jar --spring.profiles.active=pro
