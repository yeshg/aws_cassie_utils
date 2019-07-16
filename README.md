# Instructions for connecting to Intel Dev Cloud and getting live monitoring


Basic strategy is to use a 2-level ssh tunnel to forward from port 6006 of job server to same port on login server to same port on local machine.


First open terminal instance and connect to login server normally. This connection will be used to run the actual job. Make sure you have configured hostname in `~/.ssh/config`.

Once this instance is open launch job server and connect via ssh. Don't launch actual job yet.

```
ssh <hostname>
qstat <arguments>
```

Then open new terminal instance and create ssh tunnel for port 6006 (or any other port... default visdom port of 8097 seems to be binded to something on DevCloud internally).

```
ssh -L 6006:localhost:6006 <hostname>
```

Next use `qstat` to find the job ID of the server and get it's info with `qstat -xf <JOB_ID>`

In the result, search for <exec_host>*something*/0-1</exec_host> using something like `grep`

Then do second layer of ssh tunnel:

```
ssh -L 6006:localhost:6006 <*something*>
```

In other terminal, launch job itself. Go to localhost:6006 in browser.

Note that 6006 is not the default port for PyTorch.