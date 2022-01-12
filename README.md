# Azure Terraform for GAN Deep Learning Training

This code is designed to launch a VM instance, clone a [GAN training repository](https://github.com/sem-onyalo/gan-training-model) onto that instance and then train a GAN model.

To run this code locally you'll need your Azure credentials configured. To do this [download and install the Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) and then run the command below.

```
az login
```

Training can be launched from a bash terminal using the command below.

```
./run
```

You'll most likely need to specify a specific training command, for example parameters for the training code like the command below.

```
./run -c 'python3 main.py --train' -f 'python3 app.py'
``` 

You can specify a different repository, like the command below

```
./run -a 'https://github.com/your-username' -b 'your-training-repo' -d 'https://github.com/your-username' -b 'your-monitoring-repo'
```

If you specify your own repository it will need to include a bash script called `run`. See the [default training repository](https://github.com/sem-onyalo/gan-training-model) and the accompanying [automated training documentation](https://github.com/sem-onyalo/gan-training-doc) for more details.
