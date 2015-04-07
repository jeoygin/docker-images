# Java Dockerfile

This repository contains **Dockerfile** of Java for Docker's automated build published to the public Docker Hub Registry.

## Base Docker Image

* debian:wheezy

## Docker Tags

jeoygin/java provides multiple tagged images:

* `latest` (default): Oracle Java 7 JDK
* `oraclejdk7`: Oracle Java 7 JDK

## Build

    $ docker build -t "jeoygin/java" .

## Usage

    $ docker run -it --rm jeoygin/java