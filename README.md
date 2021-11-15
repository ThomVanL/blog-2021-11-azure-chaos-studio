# Azure Chaos Studio - Public Preview

## Securely orchestrated fault injections

Azure Chaos Studio is a managed service that allows you to orchestrate fault injection on your Azure resources in a controlled manner and simplifies management tasks, using mechanisms that are already built-in to the Microsoft Azure platform.

Feel free to read the [full blog post](https://thomasvanlaere.com/posts/2021/11/azure-chaos-studio-public-preview/)!

### Creating an experiment

I will create a simple web server, which will be sitting in a web subnet on the virtual network, a network security group will be associated with the web subnet. Through the use of a chaos experiment, we will inject a faulty inbound rule, in the network security group, for just a few minutes. This should cause the website to become unreachable!

#### Starter template

Deploys resources required to follow along with my blog post demo.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FThomVanL%2Fblog-2021-11-azure-chaos-studio%2Fmain%2Farm-templates%2Fstarter%2Fazuredeploy.json)

[![Visualize](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/visualizebutton.svg?sanitize=true)](http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FThomVanL%2Fblog-2021-11-azure-chaos-studio%2Fmain%2Farm-templates%2Fstarter%2Fazuredeploy.json)

#### Complete template

Deploys all the resources, as they appear at the end of the blog post demo.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FThomVanL%2Fblog-2021-11-azure-chaos-studio%2Fmain%2Farm-templates%2Fcomplete%2Fazuredeploy.json)

[![Visualize](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/visualizebutton.svg?sanitize=true)](http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FThomVanL%2Fblog-2021-11-azure-chaos-studio%2Fmain%2Farm-templates%2Fcomplete%2Fazuredeploy.json)