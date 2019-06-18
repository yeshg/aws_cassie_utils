# This is for your local machine

Command to interface with instance through jupyter notebook after running launch_notebook.sh from server branch:

```
ssh -i <private-key-of-instance>.pem -L 8000:localhost:8888 ubuntu@<public-ip-of-instance>
```

Then, go to http://localhost:8000 and use the token from launch_notebook.sh to log in.
