Vagrant machine with Apache Kafka and Zookeeper
===============================================

# Run with Vagrant and prepared environment:

```
cd vagrant && vagrant up 
```

When the process is complete, get into the machine:
```
vagrant ssh
```


Zookeeper start:
```
/usr/local/lib/zookeeper/bin/zkServer.sh start
```

Zookeeper test;
```
telnet localhost 2181
```

Kafka start/stop:
```
nohup /usr/local/lib/kafka/bin/kafka-server-start.sh /usr/local/lib/kafka/config/server.properties > /usr/local/lib/kafka/kafka.log 2>&1 &
nohup /usr/local/lib/kafka/bin/kafka-server-stop.sh /usr/local/lib/kafka/config/server.properties > /usr/local/lib/kafka/kafka.log 2>&1 &
```

Create Topic
```
/usr/local/lib/kafka/bin/kafka-topics.sh --zookeeper localhost:2181 --create --topic test --partitions 1 --replication-factor 1
```

List Topics:
```
/usr/local/lib/kafka/bin/kafka-topics.sh --list --zookeeper localhost:2181
```

Send message
```
echo "Hello, World" | /usr/local/lib/kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test > /dev/null
```

Receive message:
```
/usr/local/lib/kafka/bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic test --from-beginning
```

Send message with custom script:
- Go to location `cd /command`
- Write message body into `body.txt`
- Run script ./send.sh

```
Tip: command folder is shared so you can edit body.txt in your native system.
```