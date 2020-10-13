#!/bin/bash

echo "test" > test.txt

[ ! -d "${HOME}/.sfdx" ] && mkdir "${HOME}/.sfdx"

[ -z "${SFDX_COBU_USERNAME}" ] && exit 1

connectionFile="${HOME}/.sfdx/${SFDX_COBU_USERNAME}.json"
NL=$'\n'

contents="{${NL}"
contents="${contents}    \"username\": \"${SFDX_COBU_USERNAME}\""
[ ! -z "${SFDX_COBU_ORGID}" ] && contents="${contents},${NL}    \"orgId\": \"${SFDX_COBU_ORGID}\""
[ ! -z "${SFDX_COBU_ACCESSTOKEN}" ] && contents="${contents},${NL}    \"accessToken\": \"${SFDX_COBU_ACCESSTOKEN}\""
[ ! -z "${SFDX_COBU_REFRESHTOKEN}" ] && contents="${contents},${NL}    \"refreshToken\": \"${SFDX_COBU_REFRESHTOKEN}\""
[ ! -z "${SFDX_COBU_INSTANCEURL}" ] && contents="${contents},${NL}    \"instanceUrl\": \"${SFDX_COBU_INSTANCEURL}\""
[ ! -z "${SFDX_COBU_LOGINURL}" ] && contents="${contents},${NL}    \"loginUrl\": \"${SFDX_COBU_LOGINURL}\""
[ ! -z "${SFDX_COBU_CLIENTID}" ] && contents="${contents},${NL}    \"clientId\": \"${SFDX_COBU_CLIENTID}\""
[ ! -z "${SFDX_COBU_ISDEVHUB}" ] && contents="${contents},${NL}    \"isDevHub\": ${SFDX_COBU_ISDEVHUB}"
[ ! -z "${SFDX_COBU_CREATEDORGINSTANCE}" ] && contents="${contents},${NL}    \"createdOrgInstance\": \"${SFDX_COBU_CREATEDORGINSTANCE}\""
[ ! -z "${SFDX_COBU_CREATED}" ] && contents="${contents},${NL}    \"created\": \"${SFDX_COBU_CREATED}\""
[ ! -z "${SFDX_COBU_DEVHUBUSERNAME}" ] && contents="${contents},${NL}    \"devHubUsername\": \"${SFDX_COBU_DEVHUBUSERNAME}\""
[ ! -z "${SFDX_COBU_EXPIRATIONDATE}" ] && contents="${contents},${NL}    \"expirationDate\": \"${SFDX_COBU_EXPIRATIONDATE}\""
contents="${contents}${NL}}"

echo "Creating connection file ${connectionFile}"
echo "${contents}" > "${connectionFile}"