#!/bin/bash

N=`cat pack-count`
let "N = $N + 1"
echo $N > pack-count
cat pack-count
