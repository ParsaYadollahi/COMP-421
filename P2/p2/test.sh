#!/bin/bash

db2 -t -v < 4e.sql 2>&1 | tee test.log
