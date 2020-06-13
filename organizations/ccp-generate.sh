#!/bin/bash

function one_line_pem {
    echo "`awk 'NF {sub(/\\n/, ""); printf "%s\\\\\\\n",$0;}' $1`"
}

function json_ccp {
    local PP=$(one_line_pem $4)
    local CP=$(one_line_pem $5)
    sed -e "s/\${ORG}/$1/" \
        -e "s/\${P0PORT}/$2/" \
        -e "s/\${CAPORT}/$3/" \
        -e "s#\${PEERPEM}#$PP#" \
        -e "s#\${CAPEM}#$CP#" \
        organizations/ccp-template.json
}

function yaml_ccp {
    local PP=$(one_line_pem $4)
    local CP=$(one_line_pem $5)
    sed -e "s/\${ORG}/$1/" \
        -e "s/\${P0PORT}/$2/" \
        -e "s/\${CAPORT}/$3/" \
        -e "s#\${PEERPEM}#$PP#" \
        -e "s#\${CAPEM}#$CP#" \
        organizations/ccp-template.yaml | sed -e $'s/\\\\n/\\\n        /g'
}

ORG=manufacture
P0PORT=7051
CAPORT=7054
PEERPEM=organizations/peerOrganizations/manufacture.example.com/tlsca/tlsca.manufacture.example.com-cert.pem
CAPEM=organizations/peerOrganizations/manufacture.example.com/ca/ca.manufacture.example.com-cert.pem

echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/manufacture.example.com/connection-manufacture.json
echo "$(yaml_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/manufacture.example.com/connection-manufacture.yaml

ORG=logistics
P0PORT=9051
CAPORT=8054
PEERPEM=organizations/peerOrganizations/logistics.example.com/tlsca/tlsca.logistics.example.com-cert.pem
CAPEM=organizations/peerOrganizations/logistics.example.com/ca/ca.logistics.example.com-cert.pem

echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/logistics.example.com/connection-logistics.json
echo "$(yaml_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/logistics.example.com/connection-logistics.yaml

ORG=wholesaler
P0PORT=6051
CAPORT=6054
PEERPEM=organizations/peerOrganizations/wholesaler.example.com/tlsca/tlsca.wholesaler.example.com-cert.pem
CAPEM=organizations/peerOrganizations/wholesaler.example.com/ca/ca.wholesaler.example.com-cert.pem

echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/wholesaler.example.com/connection-wholesaler.json
echo "$(yaml_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/wholesaler.example.com/connection-wholesaler.yaml

ORG=retailer
P0PORT=5051
CAPORT=5054
PEERPEM=organizations/peerOrganizations/retailer.example.com/tlsca/tlsca.retailer.example.com-cert.pem
CAPEM=organizations/peerOrganizations/retailer.example.com/ca/ca.retailer.example.com-cert.pem

echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/retailer.example.com/connection-retailer.json
echo "$(yaml_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/retailer.example.com/connection-retailer.yaml

ORG=customer
P0PORT=9071
CAPORT=9074
PEERPEM=organizations/peerOrganizations/customer.example.com/tlsca/tlsca.customer.example.com-cert.pem
CAPEM=organizations/peerOrganizations/customer.example.com/ca/ca.customer.example.com-cert.pem

echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/customer.example.com/connection-customer.json
echo "$(yaml_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/customer.example.com/connection-customer.yaml