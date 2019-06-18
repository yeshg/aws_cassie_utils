# aws_cassie_utils


## Setting Up Remote Server
Clone this repo in the home directory of the instance. Then run setup.sh


## Interfacing with Jupyter Notebook
To interface with the instance through a jupyter notebook, run launch_notebook.sh and then run the following command from the local system:

```
ssh -i <private-key-of-instance>.pem -L 8000:localhost:8888 ubuntu@<public-ip-of-instance>
```

Then, go to http://localhost:8000 and use the token from launch_notebook.sh to log in.


## Accessing live monitoring with visdom server
To connect to the visdom server on the instance, first launch the visdom server in the background (using `screen` for) by executing

```
python -m visdom.server
```

Then, go to http://<ip-address-of-server>:8097