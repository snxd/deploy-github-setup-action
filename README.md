# Solsta Deployments Setup Action for GitHub

This project is a GitHub Action that uses Solid State Networks tools and services.  

The action is compatible with Windows, Linux, and OSX github runners, as well as Windows and OSX hosted runners.  Windows self-hosted runners require git-bash (https://git-scm.com/) in the %PATH%.

## Variables

* **solsta_client_id:** Client ID to authenticate usage of Solid State Networks console tools
* **solsta_client_secret:** Secret Key to authenticate usage of Solid State Networks console tools
* **console_version:** Version of Solsta Console Tools to use
* **scripts_version:** Version of Solsta Deploy Scripts to use

## Using

Here is an example YAML Fragment in the steps section of a build:

```yaml
    steps:
    - name: Setup Solsta Dependencies
      uses: snxd/deploy-github-setup-action@main
      with:
        console_version: '6.1.2.51'
        scripts_version: '3.7.18'
        solsta_client_id: 'solsta client id'
        solsta_client_secret: 'solsta client secret'
```

## License
(C) 2022 Solid State Networks, LLC.  All Rights Reserved.
