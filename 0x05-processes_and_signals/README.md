# 0x05. Processes and signals

## About
Unix processes and signals
* Processes Identification Number(PID)
* Terminating processes
* Searching for and terminating processes using PID
* Signal handling

## Tasks
0. Script that displays its own PID
	* [0-what-is-my-pid](0-what-is-my-pid)

1. Script that displays a list of currently running processes
	* [1-list_your_processes](1-list_your_processes)

2. Script that displays lines containing the word **'bash'**
	* [2-show_your_bash_pid](2-show_your_bash_pid)

3. Script that displays the PID, along with the process name, of processes whose name contain the word **'bash'**
	* [3-show_your_bash_pid_made_easy](3-show_your_bash_pid_made_easy)

4. Script that displays ***'To infinity and beyond indefinitely'***
	* [4-to_infinity_and_beyond](4-to_infinity_and_beyond)

5. Script that stops **4-to_infinity_and_beyond process/**
	* [5-dont_stop_me_now](5-dont_stop_me_now)

6. Alterantive script that stops **'4-to_infinity_and_beyond process/** 
	* [6-stop_me_if_you_can](6-stop_me_if_you_can)

7. Script that displays:
* ***'To infinity and beyond indefinitely'***
* With a sleep 2 in between each iteration
* ***'I am invincible!!!'*** when receiving a SIGTERM signal
	* [7-highlander](7-highlander)

8. Script that kills the process 7-highlander
	* [8-beheaded_process](8-beheaded_process)
9. Script that:
* Creates the file **/var/run/myscript.pid** containing its PID
* Displays ***'To infinity and beyond indefinitely'***
* Displays ***'I hate the kill'*** command when receiving a SIGTERM signal
* Displays ***'Y U no love me?!'*** when receiving a SIGINT signal
* Deletes the file **/var/run/myscript.pid** and terminates itself when receiving a SIGQUIT or SIGTERM signal
	* [100-process_and_pid_file](100-process_and_pid_file)

10. Write a:
* manage_my_process Bash script that:
	* Indefinitely writes I am alive! to the file /tmp/my_process
	* In between every I am alive! message, the program should pause for 2 seconds
* Bash (init) script 101-manage_my_process that manages manage_my_process. (both files need to be pushed to git)

	**Requirements:**
	* When passing the argument start:
		* Starts manage_my_process
		* Creates a file containing its PID in /var/run/my_process.pid
	*	Displays manage_my_process started
	* When passing the argument stop:
		* Stops manage_my_process
		* Deletes the file /var/run/my_process.pid
		* Displays manage_my_process stopped
	* When passing the argument restart
		* Stops manage_my_process
		* Deletes the file /var/run/my_process.pid
		* Starts manage_my_process
		* Creates a file containing its PID in /var/run/my_process.pid
		* Displays manage_my_process restarted
	* Displays Usage: manage_my_process {start|stop|restart} if any other argument or no argument is passed
	* [101-manage_my_process](101-manage_my_process), [manage_my_process](manage_my_process)

11. Program that creates zombie processes
	* [102-zombie.c](102-zombie.c)
