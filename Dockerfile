FROM maven:3-openjdk-11
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello && \
    mvn -f boxfuse-sample-java-war-hello/pom.xml package

FROM tomcat:8
RUN rm -rf /usr/local/tomcat/ROOT
COPY --from=0 /boxfuse-sample-java-war-hello/target/hello-1.0 /usr/local/tomcat/ROOT
