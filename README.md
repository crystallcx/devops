
# Preparation

## Create Virtual Environment
### Ubuntu
```
python3 -m venv venv
source venv/bin/activate
```

### Windows
```
python -m venv venv
./venv/Scripts/activate
```


## Using SSH to login to Github
### Generate your ssh key 
1. Enter the following command in terminal: \
    `ssh-keygen -t ed25519 -C "your_email@gmail.com"`
    ```
    > Enter a file in which to save the key (/c/Users/YOU/.ssh/id_ALGORITHM):[Press enter]
    > Enter passphrase (empty for no passphrase): [Type a passphrase]
    > Enter same passphrase again: [Type passphrase again]
    ```
    Two files will have been generated: 
    - `id_ed25519` contains the private key value
    - `id_ed25519.pub` contains the public key value
    - 
    

2. Add the SSH key to your account on GitHub
    - Navigate to Account Settings -> SSH and GPG Keys 
    - Click 'New SSH Key'
    - Paste in the value of the public key in the Key field.
    - Obtain the public key using `cat ~/.ssh/id_ed25519.pub`

3. Now you should be able to clone your private repository.


## Create a GitHub access token

As of 2020, GitHub no longer allows command-line authentication using your regular password. A solution to this is to create a "Personal Access Token"
1. To create a Personal Access Token, click [here](https://github.com/settings/tokens/new?description=HPC%20access%20token&scopes=repo%2Cgist%2Cread%3Aorg%2Cworkflow), and alter the expiration period to "No expiration".
2. Generate the token, and save the resulting token value somewhere *secure* (the token will be a long string of characters starting with "ghp_"). This is the password you will use to access the repository.

## Permanently authenticating with Git repositories
Run the following command to enable credential caching:
```
$ git config credential.helper store
$ git push https://github.com/owner/repo.git

Username for 'https://github.com': <USERNAME>
Password for 'https://USERNAME@github.com': <PASSWORD>
```
To configure this not per repository but globally:
```
git config --global credential.helper credential.helper store
git config --global credential.helper 'cache --timeout 7200'
```
---
