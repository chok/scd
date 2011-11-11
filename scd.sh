#!/bin/bash

BASE_PATH=$(pwd)
FOLDER=$1
MAXDEPTH=3

PATHS=($(find ${BASE_PATH} -maxdepth ${MAXDEPTH} -type d -name "*${FOLDER}*"))

if [ ${#PATHS[@]} = 0 ]
then
  echo no results
elif  [ ${#PATHS[@]} = 1 ]
then
  cd ${PATHS[0]}
else
  echo many results
  PATHS=($(echo ${PATHS[@]} | sed -e "s|${BASE_PATH}/||g"))
  echo ${PATHS[@]}
fi

