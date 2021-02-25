#!/bin/bash

db2 -t -v < 5insert.sql 2>&1 | tee test5.log
