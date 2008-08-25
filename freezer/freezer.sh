#!/bin/bash

rails $1
cd $1
/usr/bin/rake rails:freeze:edge TAG=rel_2-0-0_RC1
