#!/bin/bash

echo "Display_Name: ${DISPLAY_NAME}"
echo "MI_NAME: ${MI_NAME}"
echo "OBJECT_ID: ${OBJECT_ID}"
echo "RG_NAME: ${RG_NAME}"
az sql mi ad-admin create -u "${DISPLAY_NAME}" --mi "${MI_NAME}" -i "${OBJECT_ID}" -g "${RG_NAME}"
echo "${DISPLAY_NAME} assigned as ${MI_NAME} admin"