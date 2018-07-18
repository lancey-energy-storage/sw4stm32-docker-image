#!/usr/bin/expect


spawn ./install_sw4stm32_linux_64bits-v2.4.run -f -c
expect "Press 1 to continue, 2 to quit, 3 to redisplay"
send "1\r"
#expect -timeout 15 {"--More--"}
#send "\r"
expect  "Press 1 to continue, 2 to quit, 3 to redisplay"
send "1\r"
expect "Press 1 to continue, 2 to quit, 3 to redisplay"
send "1\r"
expect "Press 1 to accept, 2 to reject, 3 to redisplay"
send "1\r"
expect "Press 1 to accept, 2 to reject, 3 to redisplay"
send "1\r"

expect "Select the installation path:"
send "/root/Ac6/SystemWorkbench\r"
expect "Enter O for OK, C to Cancel:"
send "O\r"
expect "Press 1 to continue, 2 to quit, 3 to redisplay"
send "1\r"

expect "Enter Y for Yes, N for No:"
send "Y\r"
expect "Press 1 to continue, 2 to quit, 3 to redisplay"
send "1\r"
#Unpacking , could take a while
expect -timeout 900 "Enter Y for Yes, N for No:"
send "Y\r"
expect "Select the installation script (path must be absolute)"
send "\r"
expect "Application installed on /root/Ac6/SystemWorkbench"
close
