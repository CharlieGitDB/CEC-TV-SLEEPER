# CEC TV SLEEPER 
This is a script to run on a Raspberry Pi connected to a TV without a timed sleep function.  


Instructions to run:  
1. Run `chmod +x app.sh` in a terminal
2. In `cec-tv-sleeper.service` replace `ExecStart` with the path to your app.sh
3. In `cec-tv-sleeper.service` replace `WorkingDirectory` with the path to the directory that contains app.sh
4. Run `cp cec-tv-sleeper.service /etc/systemd/system/cec-tv-sleeper.service`  
Note you may to run it in sudo, if so run `sudo !!` to rerun the command
5. Run `systemctl daemon-reload`  
6. Run `systemctl enable cec-tv-sleeper.service`  
7. Run `systemctl start cec-tv-sleeper`
8. Confirm it worked by reading the logs to see the start message `journalctl -u cec-tv-sleeper`