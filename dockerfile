# 第一行必须指定基于的容器镜像
FROM registry.cn-hangzhou.aliyuncs.com/xgq-dockerimages/centos:7

# 维护者信息
MAINTAINER xgq

RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
  && echo 'Asia/Shanghai' >/etc/timezone
add jdk-8u411-linux-x64.tar.gz /usr/local/
add apache-tomcat-9.0.96.tar.gz /usr/local/
RUN rm -f /usr/local/apache-tomcat-9.0.96/webapps/*
#RUN mkdir -p /data
env JAVA_HOME=/usr/local/jdk1.8.0_411
env JRE_HOME=${JAVA_HOME}/jre
env CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
env PATH=${JAVA_HOME}/bin:$PATH
env CATALINA_HOME=/usr/local/apache-tomcat-9.0.96
env LC_ALL=en_US.UTF-8
ADD test /usr/local/apache-tomcat-9.0.96/webapps/

expose 8080

#CMD /usr/local/apache-tomcat-9.0.96/bin/startup.sh

# 容器启动时执行指令
ENTRYPOINT [ "/usr/local/apache-tomcat-9.0.96/bin/catalina.sh", "run" ]
