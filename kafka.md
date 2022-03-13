Kafka is a platform for handling data feeds. Here's a [short clip about kafka](https://youtu.be/FKgi3n-FyNU) and a [playlist about kafka](https://www.youtube.com/playlist?list=PL1vMgwLWNQiBmdGTXM0jR4fImrs3YHJGJ) for futher reading/watching.

This guide is about consuming kafka topic messages as a client from your local environment. To do that, we first need to download and have the client running locally.

> Note: If you don't have a kafka host to consume messages from, you can start a local kafka host first by following the guide here [Kafka on local](#kafka-on-local).

- [Prerequisites](#prerequisites)
- [Download the kafka client](#download-the-kafka-client)
- [Subscribe to a kafka topic](#subscribe-to-a-kafka-topic)
- [Kafka on local](#kafka-on-local)
  - [Create a test topic](#create-a-test-topic)
  - [Post a message to the test topic](#post-a-message-to-the-test-topic)

# Prerequisites

Depending on the OS you're using, you would need to have:
- bash OR [git and git for bash](https://git-scm.com/downloads) if running on windows
- java
  - with windows, download and install the [java SDK](https://openjdk.java.net/)
  - with linux, install [SDKMan and install the java SDK](./configs/env-setup-linux.md#sdkman)
- docker
  - with windows, download and use [desktop for docker](https://hub.docker.com/editions/community/docker-ce-desktop-windows).
  - with linux, download [docker engine](https://docs.docker.com/engine/install/ubuntu/)
# Download the kafka client

Download the .tgz file for the latest version [here](https://www.apache.org/dyn/closer.cgi?path=/kafka/3.1.0/kafka_2.13-3.1.0.tgz) or a specific version of the client kafka [here](https://dlcdn.apache.org/kafka/).

- Create a `kafka` folder under C:\
- Open the .tgz file, it will contain a .tar file.
- Extract the .tar file and copy its contect to C:\kafka.
- You should then have a directory structure like so:
  - C:\kafka\\{kafka-version}\bin

# Subscribe to a kafka topic

To subscribe and listen for kafka messages, you will need information about the `kafka broker url` and a `kafka topic`.

With these, you can run the `kafka-console-consumer` script from the kafka directory you extracted the kafka client to, like:

```bash
bin/kafka-console-consumer.sh --topic {{ kafka topic }} --from-beginning --bootstrap-server {{ kafka broker url }}
```

If you have kafka running locally, it would look something like:

```bash
bin/kafka-console-consumer.sh --topic test-topic --from-beginning --bootstrap-server localhost:29092
```

You should then start recieving messages from the kafka topic you subscribed to.

# Kafka on local

To start a local instance of kafka, run the `up` script on [./kafka/docker](./kafka/docker).

```bash
./kafka/on-local/up.sh
```

This creates a docker image and starts a kafka container. If you already have a kafka client installed, continue with [Create a test topic](#create-a-test-topic)). Otherwise, [Download the kafka client](#download-the-kafka-client).

## Create a test topic

Create a test topic by running the `kafka-topics` script from the kafka client. From the kafka directory you extracted the kafka client, run:

```bash
bin/kafka-topics.sh --create --topic test-topic --partitions 1 --replication-factor 1 --bootstrap-server localhost:29092
```

You will get confirmation from kafka that the topic is created.

```bash
Created topic test-topic
```

## Post a message to the test topic

Post a message to the test topic you created by running:

```bash
bin/kafka-console-producer.sh --topic test-topic --bootstrap-server localhost:29092
```

When the console opens, type a message and hit enter

```
this is a test message
```

You should have the message posted to the `test-topic` topic. And you can check this message with the client consumer. See [Subscribe to kafka topic](#subscribe-to-kafka-topic) to check this message.
