#!/bin/bash

export JAVA_HOME=/home/work/jdk-1.8
export CLASSPATH=$JAVA_HOME/lib:$JAVA_HOME/jre/lib
export PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH

java_max_heap_size=1024M
java_initail_heap_size=1024M
java_young_heap_size=400M
