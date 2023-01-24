# Nolus-Protocol-Autodelegate-skript


![Иллюстрация к проекту](https://avatars.githubusercontent.com/u/103436687?s=200&v=4)

This is autodelegate skript for Nolus Protocol nolus-rila chain, change the parameters for yourself: DELEGATOR_ADDRESS, VALIDATOR_ADDRESS, WALLET_NAME, your_password.

Step 1: Upload the script to your server. Give the file a name (Nolus_skript.sh example) 
Step 2: write in command line chmod +x Nolus_skript.sh 
Step 3: sed -i -e 's/\r$//' Nolus_skript.sh 
Step 4: Rune the skritpe ./Nolus_skript.sh

If you wanna stop it, use CTRL+C.
P.s. You can run the script in the background so that it doesn't stop working when you exit the server. To do this, you can use the *screen* utility.
