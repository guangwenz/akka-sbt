# Scala and sbt Dockerfile

This repository contains **Dockerfile** of [Scala](http://www.scala-lang.org) and [sbt](http://www.scala-sbt.org).


## Base Docker Image ##

* [openjdk](https://hub.docker.com/_/openjdk), 8-slim is current version.


## How to Build it

* `docker build -t zgwmike/akka-sbt .`
* `docker tag zgwmike/akka-sbt zgwmike/akka-sbt:2.12.6`

## Usage ##

1. Install [Docker](https://www.docker.com)
2. Pull [automated build](https://hub.docker.com/r/zgwmike/akka-sbt/) from public [Docker Hub Registry](https://registry.hub.docker.com):
```
docker pull zgwmike/akka-sbt
```
Alternatively, you can build an image from Dockerfile:
```
docker build -t zgwmike/akka-sbt github.com/zgwmike/akka-sbt
```


## Usage ##

```
docker run -it --rm zgwmike/akka-sbt sbt clean compile
```

## Versions included ##

Scala: 2.12.6
Sbt: 1.1.6
Akka: 2.5.13
Akka-http: 10.1.3
Akka-management: 0.14.0
Slick: 3.2.1
Kamon: 1.1.0
Akka-down-resolver: 1.2.4

## Contribution policy ##

Contributions via GitHub pull requests are gladly accepted from their original author. Along with any pull requests, please state that the contribution is your original work and that you license the work to the project under the project's open source license. Whether or not you state this explicitly, by submitting any copyrighted material via pull request, email, or other means you agree to license the material under the project's open source license and warrant that you have the legal authority to do so.


## License ##

This code is open source software licensed under the [Apache 2.0 License]("http://www.apache.org/licenses/LICENSE-2.0.html").
