
## Preparation

### Create a GitHub access token

As of 2020, GitHub no longer allows command-line authentication using your regular password. A solution to this is to create a "Personal Access Token"
1. To create a Personal Access Token, click [here](https://github.com/settings/tokens/new?description=HPC%20access%20token&scopes=repo%2Cgist%2Cread%3Aorg%2Cworkflow), and alter the expiration period to "No expiration".
2. Generate the token, and save the resulting token value somewhere *secure* (the token will be a long string of characters starting with "ghp_"). This is the password you will use to access the repository.

### Permanently authenticating with Git repositories
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

Github actions