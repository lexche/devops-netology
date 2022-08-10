# Домашнее задание к занятию "09.02 CI\CD"


1

![img.png](screenshots/9.2.1.png)

2

    <metadata modelVersion="1.1.0">
    <groupId>netology</groupId>
    <artifactId>java</artifactId>
    <versioning>
    <latest>8_282</latest>
    <release>8_282</release>
    <versions>
    <version>8_102</version>
    <version>8_282</version>
    </versions>
    <lastUpdated>20220508211011</lastUpdated>
    </versioning>
    </metadata>

3

    <project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
      <modelVersion>4.0.0</modelVersion>

      <groupId>com.netology.app</groupId>
      <artifactId>simple-app</artifactId>
      <version>1.0-SNAPSHOT</version>
       <repositories>
        <repository>
          <id>my-repo</id>
          <name>maven-public</name>
          <url>http://localhost:8081/repository/maven-releases/</url>
        </repository>
      </repositories>
      <dependencies>
         <dependency>
          <groupId>netology</groupId>
          <artifactId>java</artifactId>
          <version>8_282</version>
          <classifier>distrib</classifier>
          <type>tar.gz</type>
        </dependency>
      </dependencies>
    </project>
