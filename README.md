# TeamCity Azure Resource Manager Template

[![official project](http://jb.gg/badges/incubator.svg)](https://confluence.jetbrains.com/display/ALL/JetBrains+on+GitHub)

The template which allows deploying the TeamCity [server](https://hub.docker.com/r/jetbrains/teamcity-server/) and [agent](https://hub.docker.com/r/jetbrains/teamcity-agent/) in Azure cloud. It allocates a MySQL database and a virtual machine with CoreOS, and starts containers from official TeamCity docker images in the VM.

[![Deploy to Azure](https://azuredeploy.net/deploybutton.svg)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fdtretyakov%2Fteamcity-azure-template%2Fmaster%2Fazuredeploy.json) 
