FROM bladex/alpine-java:openjdk17_cn_slim

LABEL maintainer="bladejava@qq.com"

RUN mkdir -p /blade

WORKDIR /blade

EXPOSE 80

COPY ./src/blade-api.jar ./app.jar

ENTRYPOINT ["java", "--add-opens", "java.base/java.lang=ALL-UNNAMED", "--add-opens", "java.base/java.lang.reflect=ALL-UNNAMED", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]

CMD ["--spring.profiles.active=test"]
