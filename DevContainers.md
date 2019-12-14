# DevContainers

[Visual Studio Code](https://code.visualstudio.com/) (_as of from version 1.35_) introduced an exciting set of extensions for _remote development_. I highly recommend to install [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack) extension pack, it'll install below extensions for you;

* [Remote - Containers](https://aka.ms/vscode-remote/download/containers) : Work with a sandboxed toolchain or container-based application by opening any folder mounted into or inside a container.

* [Remote - SSH](https://aka.ms/vscode-remote/download/ssh) : Work with source code in any location by opening folders on a remote machine/VM using SSH. Supports *x86_64*, _ARMv8l_ (_AArch64_) and _ARMv7l_ (_AArch32_) _glibc-based_ Linux hosts.

* [Remote - WSL](https://aka.ms/vscode-remote/download/wsl) : Get a Linux-powered development experience from the comfort of Windows by opening any folder in the [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/about).

## System Requirements

It's only needed to have [Docker](https://hub.docker.com/?overlay=onboarding) , [VS Code](https://code.visualstudio.com/) and [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack) extension pack, on the machine.

## Purpose

Setting up a development environment for a project sometimes can be a _lengthy_ and _complex_ process. Especially if you're working on a couple of projects at the same time, some of the requirements for a project may conflict with the requirements of the other project.

Plus, you need to install a combination of every _tool_, every _library_, every _extension_, every _SDK_ required for all the projects on your machine.

Also, you may want to change [Visual Studio Code](https://code.visualstudio.com/) settings per project, because every project requires different settings.

For example, in one of the projects you may need, _Node v11_, _Java v8_, _Maven_ as package manager, couple of settings for [Visual Studio Code](https://code.visualstudio.com/), set of extensions in [Visual Studio Code](https://code.visualstudio.com/). But, you may need, _Node v13_, _Python v3.7_, _pip_ as package manager, _.Net Core 3.1_, couple of different settings for [Visual Studio Code](https://code.visualstudio.com/), another set of extensions in [Visual Studio Code](https://code.visualstudio.com/), etc.

Other than those, you may need, [PowerShell](https://docs.microsoft.com/en-us/powershell/) for one of the projects and [Bash](https://www.gnu.org/software/bash/) for another project. You may need, a couple of libraries installed on your machine for a project, but not for every project.

If we want to extend the requirements, we may add, [Ruby](https://www.ruby-lang.org/en/), [PHP](https://www.php.net/), [Redis](https://redis.io/), [Terraform](https://www.terraform.io/), [Kubernetes](https://kubernetes.io/), [Helm](https://helm.sh/), etc. as requirements for projects.

Over time, our development machine has almost every kind of _tools_, _SDKs_, _extensions_, _libraries_ installed on it, and getting slower and slower.

We may end-up with configuration conflicts, version conflicts, etc. and those conflicts are the hardest to find and sometimes to fix.

Setting up a machine for a project (especially if the project is relatively big/complex one) is hard, keeping setup instructions is also hard to keep up-to-date.

Onboarding a new team member sometimes requires more than 1 day to make sure that he/she is having the exact same tools with the exact same versions on his/her machine.

This is another problematic area, conflicts between team members' machines.

To overcome this problem, we may have a clean development machine, with only Docker, Visual Studio Code and [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack) extension pack.

Basically, we're using a `Dockerfile` to define our development environment for a project and develop the project inside of this development environment. So, every team member spends only a couple of minutes to build the _Docker Image_ on his/her machine. After that, we can make sure that every team member has the exact same version of every tool with the exact same versions.

## Getting started

Open a project folder with Visual Studio Code, create `.devcontainer` folder at the root of the project. Create `devcontainer.json` and `Dockerfile` files in the `.devcontainer` folder.

Basically `devcontainer.json` file is for configuring Visual Studio Code for the project, and `Dockerfile` file is for building the actual development environment with Docker.

Building a _Docker Image_ for _RunTime_ of the project and _DevelopmentTime_ of the project is two different things.

If you're building a _Docker Image_ for the RunTime of the project, you most probably want to make it simpler, smaller, etc. Because _Docker Image_ is related to the performance of the project. You may start one of the smallest, fastest base images, such as, Alpine, etc.

But, if you're building a _Docker Image_ for the DevelopmentTime of the project, you may want to have _all_ of the tools, libraries installed on the image, so you can have a comfortable development experience. You must consider to start one of the common base images, such as, Ubuntu, Debian, etc.

### Configuring Visual Studio Code

Open `devcontainer.json` file, add following structure into it;

```json
{
  "name": "Project Development Environment",
  "dockerFile": "Dockerfile",
  "runArgs": [
    "-v", "/var/run/docker.sock:/var/run/docker.sock"
  ],
  "settings": {
    "terminal.integrated.shell.linux": "/bin/bash",
    "workbench.iconTheme": "vscode-icons"
  },
  "extensions": [
    "ms-azuretools.vscode-docker",
    "ms-vsliveshare.vsliveshare",
    "vscode-icons-team.vscode-icons",
    "editorconfig.editorconfig"
  ]
}
```

`name` node is for configuring the friendly display name for the dev container.

`Dockerfile` node is for configuring the name of the _Dockerfile_ which will be used to build the _Docker Image_.

`runArgs` node is for passing some parameters to underlying _Docker Image_, aka _DevContainer_. In this example, we're binding host `docker.sock` file to `docker.sock` file in the _DevContainer_, so we can use [Docker CLI](https://docs.docker.com/engine/reference/commandline/cli/) from within the _DevContainer_, but actually it runs the command on the host machine.

`settings` node is for changing the [Visual Studio Code](https://code.visualstudio.com/) settings only for the opened project. Such as, changing the Terminal shell, changing the Icon Theme, etc.

`extensions` node is for installing extensions for [Visual Studio Code](https://code.visualstudio.com/), only for the opened project. Such as, [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker), [Live Share](https://marketplace.visualstudio.com/items?itemName=ms-vsliveshare.vsliveshare), [VS Code Icons Theme](https://marketplace.visualstudio.com/items?itemName=vscode-icons-team.vscode-icons), [EditorConfig](https://marketplace.visualstudio.com/items?itemName=editorconfig.editorconfig), etc.

Other than above nodes, we may include following nodes as-well;

`appPort` node is for exposing ports from _DevContainer_ to host machine. This is useful if you want to access a port from _DevContainer_ from host machine. In the following example it binds port _3000_ from _DevContainer_ to port _3000_ on the host machine.

```json
"appPort": 3000:3000
```

`postCreateCommand` node is for running commands after the container has been created. In the following example, it's installing npm packages after _DevContainer_ created.

```json
"postCreateCommand": "npm install"
```

You can find other available properties in the full [devcontainer.json reference](https://code.visualstudio.com/docs/remote/containers#_devcontainerjson-reference)

## Sample Projects with DevContainer Configured

* [.NET Core Sample](https://github.com/Microsoft/vscode-remote-try-dotnetcore)
* [Node Sample](https://github.com/Microsoft/vscode-remote-try-node)
* [Python Sample](https://github.com/Microsoft/vscode-remote-try-python)
* [Go Sample](https://github.com/Microsoft/vscode-remote-try-go)
* [Java Sample](https://github.com/Microsoft/vscode-remote-try-java)
* [Rust Sample](https://github.com/microsoft/vscode-remote-try-rust)
* [C++ Sample](https://github.com/microsoft/vscode-remote-try-cpp)
* [PHP Sample](https://github.com/microsoft/vscode-remote-try-php)

## Summary

Using [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack) extension pack helps to keep development machine clean, also it helps to onboard new people to the project easier.

_DevContainer_ also allows all contributors to work on the project in a standardised environment.

Contributors require less time and guidance to configure their machine for the project, and configuration of the machine causes fewer issues.

## References

[Developing inside a Container](https://code.visualstudio.com/docs/remote/containers)

[VS Code Remote Development Container Definitions](https://github.com/microsoft/vscode-dev-containers)

[Remote Development Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)

[devcontainer.json File Reference](https://code.visualstudio.com/docs/remote/containers#_devcontainerjson-reference)

[Dockerfile Reference](https://docs.docker.com/engine/reference/builder/)
