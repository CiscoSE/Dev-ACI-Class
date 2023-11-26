# Steps for Using Curl to work with ACI

## Getting a Token

```
curl -k --cookie-jar ./cookie -X POST -d '{"aaaUser":{"attributes":{"name":"admin","pwd":"'${ANSIBLE_PASSWORD}'"}}}' https://${simulator}/api/aaaLogin.json | jq ".imdata[0].aaaLogin.attributes.token"
```

## Get list of Tenants
```
curl -k -b ./cookie -X GET https://${simulator}/api/class/uni/fvTenant.json
```

## Get a Tenant
```
curl -k -b ./cookie -X GET https://${simulator}/api/mo/uni/tn-common.json
```

## Get a Tenant and all Child Objects
curl -k -b ./cookie -X GET https://${simulator}/api/mo/uni/tn-mgmt.json?query-target=subtree  | jq '.'

## Get a Tenant and all child configuration objects
curl -k -b ./cookie -X GET https://${simulator}/api/mo/uni/tn-m"gmt.json?rsp-prop-include=config-only&query-target=subtree" | jq '.'

## Create Two Tenants (Requires the External xml file)
curl -k -b ./cookie -X POST -d "$(cat ./json_examples/tenant-creation.xml)" https://${simulator}/api/node/mo.xml

## Delate a Tenant
curl -k -b ./cookie -X DELETE https://${simulator}/api/mo/uni/tn-Test1.xml

## Links we want to look at

DevNet Learning Labs (Free Training)
https://developer.cisco.com/learning/

DevNet Sandboxes
https://developer.cisco.com/site/sandbox/

API Reference Guide
https://developer.cisco.com/docs/aci/#!introduction

