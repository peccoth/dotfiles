#!/bin/sh

date +%S
(sleep 3 && date +%S) &
echo "test"
(sleep 3 && echo "test2")
