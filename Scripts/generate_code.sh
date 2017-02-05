#!/bin/bash

SRC_DIR=../ListenerManagerGenerator

../Pods/Sourcery/bin/sourcery --watch ${SRC_DIR} ${SRC_DIR}/Templates ${SRC_DIR}/Generated