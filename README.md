# Solsta Deployments Setup Action for GitHub

This project is a GitHub Action that uses Solsta tools and services.  

The action is compatible with Windows, Linux, and OSX github runners, as well as Windows and OSX hosted runners.  Windows self-hosted runners require git-bash (https://git-scm.com/) in the %PATH%.

## Variables

* **solsta_client_id:** Client ID to authenticate usage of Solsta console tools
* **solsta_client_secret:** Secret Key to authenticate usage of Solsta console tools
* **console_version:** Version of Solsta Console Tools to use
* **scripts_version:** Version of Solsta Deploy Scripts to use

## Using

Here is an example YAML Fragment in the steps section of a build:

```yaml
    steps:
    - name: Setup Solsta Dependencies
      uses: snxd/deploy-github-setup-action@v5
      with:
        console_version: '7.2.49'
        scripts_version: '3.11.0'
        solsta_client_id: ${{ secrets.SOLSTA_CLIENT_ID }}
        solsta_client_secret: ${{ secrets.SOLSTA_CLIENT_SECRET }}
```

## License
(C) 2026 Solsta Inc.  All Rights Reserved.
