# aws_cassie_utils

Clone this repo in the home directory of the instance. Then run setup.sh

To interface with the instance through a jupyter notebook, run launch_notebook.sh and run the following command from local system:

```
ssh -i <private-key-of-instance>.pem -L 8000:localhost:8888 ubuntu@<public-ip-of-instance>
```

Then, go to http://localhost:8000 and use the token from launch_notebook.sh to log in.
