#!/bin/sh
grep "ProgramVersion::theVersionNumber" src/version.cpp \
        | awk '{print $3;}' \
        | sed s/[\(\"\;\)]//g