#!/bin/bash
RED_COLOR='\033[0;31m'
WITHOU_COLOR='\033[0m'
DELEGATOR_ADDRESS='YOUR_ADDRESS'
VALIDATOR_ADDRESS='YOUR_VOLOPER'
DELAY=60*1 #in secs - how often restart the script 
WALLET_NAME=wallet #example: = WALLET_NAME=wallet_qwwq_54
#NODE="tcp://localhost:26657" #change it only if you use another rpc port of your node

for (( ;; )); do
        echo -e "Get reward from Delegation"
        echo "YOUR_PASSWORD" | nolusd tx distribution withdraw-rewards ${VALIDATOR_ADDRESS} --from ${WALLET_NAME} --chain-id nolus-rila --fees 500unls --commission -y
        for (( timer=30; timer>0; timer-- ))
        do
                printf "* sleep for ${RED_COLOR}%02d${WITHOUT_COLOR} sec\r" $timer
                sleep 1
        done
 
#        BAL=$(nolusd query bank balances ${DELEGATOR_ADDRESS} --chain-id nolus-rila | awk '/amount:/{print $NF}' | tr -d '"')
        BAL=$(nolusd query bank balances ${DELEGATOR_ADDRESS} --chain-id nolus-rila --output json | jq -r '.balances[] | select(.denom=="unls")' | jq -r .amount)
        echo -e "BALANCE: ${GREEN_COLOR}${BAL}${WITHOU_COLOR} unls\n"

       
        BAL=$(nolusd query bank balances ${DELEGATOR_ADDRESS} --chain-id nolus-rila --output json | jq -r '.balances[] | select(.denom=="unls")' | jq -r .amount)
#        BAL=$(nolusd query bank balances ${DELEGATOR_ADDRESS} --chain-id nolus-rila | awk '/amount:/{print $NF}' | tr -d '"')
        BAL=$(($BAL-50000))
        echo -e "BALANCE: ${GREEN_COLOR}${BAL}${WITHOU_COLOR} unls\n"
        echo -e "Stake ALL 11111\n"
        if (( BAL > 900000 )); then
        echo "YOUR_PASSWORD" | nolusd tx staking delegate ${VALIDATOR_ADDRESS} ${BAL}unls --from ${WALLET_NAME} --chain-id nolus-rila --fees 1000unls --yes
        else
          echo -e "BALANCE: ${GREEN_COLOR}${BAL}${WITHOU_COLOR} unls BAL < 900000 ((((\n"
        fi 
        for (( timer=${DELAY}; timer>0; timer-- ))
        do
                printf "* sleep for ${RED_COLOR}%02d${WITHOU_COLOR} sec\r" $timer
                sleep 1
        done       

done