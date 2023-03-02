## SSH forwarding
To add your SSH keys to the local SSH agent on your machine, you can follow these steps:
1. Start the SSH agent by running the following command in terminal: `eval $(ssh-agent -s)`

2. Add your SSH private key to the SSH agent by running the following command: `ssh-add /path/to/your/private/key`
Replace /path/to/your/private/key with the actual path to your SSH private key file. If your SSH key has a passphrase, you will be prompted to enter it.
e.g. `ssh-add ~/.ssh/id_rsa`

3. Verify that your SSH key has been added to the SSH agent by running the following command: `ssh-add -l`

[from](https://medium.com/@tonistiigi/build-secrets-and-ssh-forwarding-in-docker-18-09-ae8161d066)
```
# syntax=docker/dockerfile:experimental
FROM alpine
# install ssh client and git
RUN apk add --no-cache openssh-client git
# download public key for github.com
RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
# clone our private repository
RUN --mount=type=ssh git clone git@github.com:myorg/myproject.git myproject
```
On the docker client side, you need to define that SSH forwarding is allowed for this build by using the--ssh flag.
```
docker build --ssh default .
```

## Docker credentials
To create your access token:
1. Log in to hub.docker.com.
2. Click on your username in the top right corner and select Account Settings.
3. Select Security > New Access Token.
4. Add a description for your token. ...
5. Copy the token that appears on the screen and save it.