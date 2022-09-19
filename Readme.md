# 42 - minitalk

## Project Information
The purpose of this project is to code a small data exchange program using UNIX signals.

## Mandatory

- Produce server & client executables
- client must send a string passed as a parameter to server (referenced by its process ID) which then displays it
- Use SIGUSR1 & SIGUSR2 signals ONLY

## Guide

UNIX SIGNAL
UNIX Signals allows to communicate proccesses to each other. There are many types of signals, you can see all signals using ```kill -l``` command. 
The SIGUSR1 and SIGUSR2 signals are set aside for you to use any way you want, default action is to terminate the process.
We can handle signals using Signal or Sigaction.
Signal cann't block signals, has different behaviour in different systems and has undefined behaviour in multiproccessing systems. 
Sigaction can block signals, behaviour doesn't depend on system.
For using sigaction, we must use sigaction struct.
```sh
struct sigaction _structName_;
_structName_.sa_flags = SA_SIGINFO;
_structName_.sa_sigaction = your_handler_function;
sigaction(SIGUSR1, &_structName_, NULL);
```
sa_flags = SA_SIGINFO — queue this signal. The default is not to queue a signal delivered to a process. If a signal isn't queued, and the same signal is set multiple times on a process or thread before it runs, only the last signal is delivered. If you set the SA_SIGINFO flag, the signals are queued, and they're all delivered.
sa_sigaction - The address of a signal handler or action for queued signals.
sigaction(int sig, const struct sigaction * act, struct sigaction * oact );
sig - The signal number (SIGUSR1 or SIGUSR2 )
act - NULL, or a pointer to a sigaction structure that specifies how you want to modify the action for the given signal.
oact - NULL, or a pointer to a sigaction structure that the function fills with information about the current action for the signal.

For sending characters, convert character to bites and send bits using ```kill(pid, _signal_)``` function.
```sh
kill(pid, SIGUSR1);
```
pid is proccess id, which is unique.
For example when bit is 1 send SIGUSR1, and when bit is 0 send SIGUSR2.

## Compilation

Clone repo and compile files into server & client executables via make.
```sh
$ ./server
PID: <PID_SERVER>

(wait)
```

```sh
$ ./client <PID_SERVER> <STRING>
```
